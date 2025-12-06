# frozen_string_literal: true
module Year2025
  class Day06 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.map{ |_, problem|
        problem[:numbers].map(&:to_i).reduce(&problem[:operation]) 
      }.sum
    end

    def part_2
      data.each_value do |problem|
        transposed = problem[:numbers].map(&:chars).transpose
        problem[:numbers] = transposed.map(&:join)
      end
      part_1
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      # def process_input(line)
      #   line.map(&:to_i)
      # end

      def integer?(str)
        !!Integer(str) rescue false
      end

      # Processes the dataset as a whole
      def process_dataset(set)
        problems = Hash.new { |h, k| h[k] = { numbers: [], operation: nil } }

        columns = (0...set.first.size).select do |y|
          set.all? { |line| line[y] == ' ' }
        end

        set.each do |line|
          number = ''
          problem_idx = 0

          line.chars.each_with_index do |token, idx|
            break if problem_idx > columns.length

            problem = problems[problem_idx]

            case token
            when '+', '*'
              problem[:operation] = token.to_sym
              problem_idx += 1
            else
              if columns.include?(idx) && integer?(number)
                problem[:numbers] << number
                problem_idx += 1
                number = ''
              else
                number += token
              end
            end
          end

          if integer?(number)
            problems[problem_idx][:numbers] << number
          end
        end

        problems
      end
  end
end
