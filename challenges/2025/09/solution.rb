# frozen_string_literal: true
module Year2025
  class Day09 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    Tile = Struct.new(:row , :col)

    def calculate_area(a, b)
      ((a.row - b.row).abs + 1) * 
      ((a.col - b.col).abs + 1)
    end

    def intersect?(a, b, segments)
      min_row, max_row = [a.row, b.row].minmax
      min_col, max_col = [a.col, b.col].minmax

      segments.each do |seg_a, seg_b|
        s_min_row, s_max_row = [seg_a.row, seg_b.row].minmax
        s_min_col, s_max_col = [seg_a.col, seg_b.col].minmax

        if min_row < s_max_row &&
          max_row > s_min_row &&
          min_col < s_max_col && 
          max_col > s_min_col
          return true
        end
      end

      false
    end

    def part_1
      data.combination(2).map { |a, b|
        calculate_area(a, b)
    }.max
    end

    # stolen from: https://github.com/chicoferreira/advent-of-code-2025/blob/main/src/bin/09.rs
    def part_2
      segments = data.each_index.map { |i| 
        [data[i], data[(i + 1) % data.length]]
      }

      data.combination(2).reduce(0) do |current_best, (a, b)|
        area = calculate_area(a, b)
        next current_best if area <= current_best
        next current_best if intersect?(a, b, segments)
        area
      end
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      def process_input(line)
        row, col = line.split(',')
        Tile.new(col.to_i, row.to_i)
      end

      # Processes the dataset as a whole
      # def process_dataset(set)
      #   set
      # end
  end
end
