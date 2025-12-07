# frozen_string_literal: true
module Year2025
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def sum_invalid_ids(range, repetitions = nil)
      total = 0

      range.each do |current|
        s = current.to_s
        len = s.length
        max_chunk = len / 2

        (1..max_chunk).each do |chunk|
          next unless (len % chunk).zero?

          reps = len / chunk
          next if repetitions and repetitions != reps

          i = chunk
          piece = s[0, chunk]
          valid = true

          while i < len
            if s[i, chunk] != piece
              valid = false
              break
            end
            i += chunk
          end

          if valid
            total += current
            break
          end
        end
      end

      total
    end

    def part_1
      data.sum { |range| 
        sum_invalid_ids(range, 2)
      }
    end

    def part_2
      data.sum { |range| 
        sum_invalid_ids(range)
      }
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      def process_input(line)
        line.split(',').map do |range|
          first, last = range.split('-').map(&:to_i)
          first..last
        end
      end

      # Processes the dataset as a whole
      # def process_dataset(set)
      #   set
      # end
  end
end
