require 'manywords'
require 'methadone'

module Manywords

  class Command
    include Methadone::Main
    include Methadone::CLILogging

    def self.run

      main do |letters, pattern = ''|
        # Make sure the given dictionary exists
        unless File.exists? options['dictionary']
          fatal "Could not load the dictionary"
          return
        end

        # Load the dictionary
        dictionary = DictionaryNode.new
        File.open(options['dictionary'], 'r') do |file|
          info "Reading the dictionary..."

          file.each_line do |line|
            # Skip proper nouns
            next if line =~ /[A-Z]/

            # Skip 1 letter words
            line.strip!
            next if line.length <= 1

            # Clean up the line
            line.downcase!

            # Add it!
            dictionary.add_word line
          end

          info "Read #{dictionary.count} words."
        end

        # Construct the pattern if given
        regex = Regexp.new(pattern)

        walker = Walker.new
        walker.walk letters do |word|
          result = dictionary.find_word word

          if result == :yes
            test_word = word.is_a?(Array) ? word.join('') : word.to_s

            puts test_word if regex =~ test_word
          end

          result
        end
      end

      version     Manywords::VERSION
      description 'Determine word combinations given a series of letters and an optional regular expression to filter.'

      arg         :letters, :required
      arg         :pattern, :optional

      options['dictionary'] = '/usr/share/dict/words'
      on('-d PATH', '--dictionary', 'Dictionary')

      go!
    end

  end

end


