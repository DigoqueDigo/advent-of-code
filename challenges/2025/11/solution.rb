# frozen_string_literal: true
module Year2025
  class Day11 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def count_paths(src, dst, circuit, memo = {})
      return 1 if src == dst
      return memo[src] if memo.include?(src)

      memo[src] = circuit.fetch(src, []).sum do |neighbor|
        count_paths(neighbor, dst, circuit, memo)
      end
    end

    def part_1
      count_paths('you', 'out', data)
    end

    def part_2
      queries = [
        [%w[svr fft], %w[fft dac], %w[dac out]],
        [%w[svr dac], %w[dac fft], %w[fft out]],
      ]

      queries.sum do |query|
        query.reduce(1) do |acc, (src, dst)|
          acc * count_paths(src, dst, data)
        end
      end
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      # def process_input(line)
      #   line.map(&:to_i)
      # end

      # Processes the dataset as a whole
      def process_dataset(set)
        set.each_with_object({}) do |line, hash|
          input, output = line.split(':', 2)
          hash[input] = output.split(' ')
        end
      end
  end
end
