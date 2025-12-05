# frozen_string_literal: true
module Year2025
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def find_invalid_ids(first, last, repetitions = nil)
      invalid_ids = Array.new
      (first..last).each do |current|
        current_s = current.to_s
        current_s_len = current_s.length
        chunk_sizes = (1..(current_s_len / 2))
            .select { |n| current_s_len % n == 0 }

        chunk_sizes.each do |chunk_size|
          chunks = current_s.scan(/.{1,#{chunk_size}}/)
          if (chunks.length == repetitions or !repetitions) and chunks.uniq.length == 1
            invalid_ids.push(current)
            break
          end
        end
      end
      invalid_ids
    end

    def part_1
      invalid_ids_sum = 0
      data.each do |range|
        first, last = range.split('-').map(&:to_i)
        invalid_ids_sum += find_invalid_ids(first, last, 2).sum
      end
      invalid_ids_sum
    end

    def part_2
      invalid_ids_sum = 0
      data.each do |range|
        first, last = range.split('-').map(&:to_i)
        invalid_ids_sum += find_invalid_ids(first, last).sum
      end
      invalid_ids_sum
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      def process_input(line)
        line.split(',')
      end

      # Processes the dataset as a whole
      # def process_dataset(set)
      #   set
      # end
  end
end
