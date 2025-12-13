# frozen_string_literal: true
module Year2025
  class Day12 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    Present = Struct.new(:grid, :area)
    Grid = Struct.new(:width, :length, :presents)

    def part_1
      data[:grids].each.count do | grid |
        grid.width * grid.length >=
          grid.presents.each_with_index.sum do | count, idx |
            count * data[:presents][idx].area
        end
      end
    end

    def part_2
      nil
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      # def process_input(line)
      #   line.map(&:to_i)
      # end

      # Processes the dataset as a whole
      def process_dataset(set)
        line_idx = 0
        grids = []
        presents = {}

        while line_idx < set.length
          line = set[line_idx]

          if line =~ /^(\d+):$/
            present_id = $1.to_i
            present_area = 0
            present_grid = []

            line_idx += 1
            line = set[line_idx]

            while line_idx < set.length && !line.empty?
              line_idx += 1
              present_grid << line
              present_area += line.count('#')
              line = set[line_idx]
            end

            presents[present_id] = Present.new(present_grid, present_area)
          end

          if line =~ /^(\d+)x(\d+):\s+(.*)$/
            grids << Grid.new($1.to_i, $2.to_i, $3.split.map(&:to_i))
          end

          line_idx += 1
        end

        { presents: presents, grids: grids }
      end
  end
end
