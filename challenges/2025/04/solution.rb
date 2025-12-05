# frozen_string_literal: true
module Year2025
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def update_map(map)
      accessible_rolls = Array.new
      map.each_with_index do |line, y_index|
        line.chars.each_with_index do |char, x_index|
          rolls = 0
          if char == '@'
            adjacent_x = ((x_index-1)..(x_index+1))
              .select{ |x| x >= 0 and x < line.length }
            
            adjacent_y = ((y_index-1)..(y_index+1))
              .select{ |y| y >= 0 and y < map.length }

            adjacent_x.each do |x|
              adjacent_y.each do |y|
                if x != x_index or y != y_index and map[y][x] == '@'
                  rolls += 1
                end 
              end
            end
            
            if rolls < 4
              accessible_rolls.push([x_index, y_index])
            end
          end
        end
      end

      accessible_rolls.each { |x,y| map[y][x] = 'X'}
      accessible_rolls.length
    end

    def part_1
      update_map(data)
    end

    def part_2
      accessible_rolls = 0
      old_accessible_rolls = nil

      while accessible_rolls != old_accessible_rolls
        old_accessible_rolls = accessible_rolls
        accessible_rolls += update_map(data)
      end

      accessible_rolls
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
