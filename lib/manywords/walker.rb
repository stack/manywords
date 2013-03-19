module Manywords

  class Walker

    def walk(letters, &block)
      list = letters.split ''
      list.sort!
      permutations [], list, &block
    end

    private

    def permutations(prefix, available, &block)
      # Visit the prefix
      result = block.call prefix

      # Do we continue from here?
      if (result != :no)
        available.each_with_index do |letter, idx|
          next_available = available.dup
          next_available.delete_at(idx)

          if letter == '+'
            ('a'..'z').each do 
              |l| permutations prefix + [ l ], next_available, &block
            end
          else
            permutations prefix + [ letter ], next_available, &block
          end
        end
      end
    end

  end

end

