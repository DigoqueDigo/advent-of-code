# frozen_string_literal: true
module Year2025
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def update_map(map)
      height = map.length
      width = map.first.length
      accessible = []

      map.each_with_index do |line, y|
        line.each_char.with_index do |char, x|
          next unless char == '@'
          rolls = 0

          (-1..1).each do |dy|
            ny = y + dy
            next if ny < 0 or ny >= height

            (-1..1).each do |dx|
              nx = x + dx
              next if nx < 0 or nx >= width
              next if dx == 0 and dy == 0

              rolls += 1 if map[ny][nx] == '@'
            end
          end

          accessible << [x, y] if rolls < 4
        end
      end

      accessible.each { |x, y| map[y][x] = 'X'}
      accessible.length
    end

    def part_1
      update_map(data)
    end

    def part_2
      total = 0
      while (changed = update_map(data)) > 0
        total += changed
      end
      total
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
