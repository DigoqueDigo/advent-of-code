# frozen_string_literal: true
module Year2025
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def find_max_joltage(bank, digits)
      joltage = ''
      start_index = 0

      (0...digits).reverse_each do |index|
          chunk = bank[start_index...(bank.length - index)]
          char, idx = chunk.each_char.with_index.max_by { |char, _i| char }
          start_index += idx + 1
          joltage += char
      end

      joltage.to_i
    end

    def part_1
      data.map { |bank| find_max_joltage(bank, 2)}.sum
    end

    def part_2
      data.map { |bank| find_max_joltage(bank, 12)}.sum
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      # def process_input(line)
      #   line.map(&:to_i)
      # end

      # Processes the dataset as a whole
      # def process_dataset(set)
      #   set
      # end
  end
end
