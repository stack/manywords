module Manywords

  class DictionaryNode

    attr_reader :count

    def initialize
      @count = 0;
      @letters = {}
      @word = false
    end

    def add_word(word, idx = 0)
      # If we've reached the end of the word, mark it as so
      if idx == word.length
        @word = true
        return
      end

      # A word will be added, so increment
      @count += 1

      # Get the letter and add it to the tree if we need to
      letter = word[idx]
      @letters[letter] = DictionaryNode.new unless @letters.key?(letter)

      # Go to the next letter
      @letters[letter].add_word word, idx + 1
    end

    def find_word(word, idx = 0)
      if !word.is_a?(String) && !word.is_a?(Array)
        raise "find_word requires an Array or a String"
      end

      # We've reached the end, so this is either a word or a partial word
      if idx == word.length
        return @word ? :yes : :maybe
      end

      # Check if this letter is valid
      letter = word[idx]
      if @letters.key? letter
        # Valid, so go to the next letter
        @letters[letter].find_word word, idx + 1
      else
        :no
      end
    end

  end

end
