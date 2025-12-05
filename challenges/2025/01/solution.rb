# frozen_string_literal: true
module Year2025
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      dial = 50
      zeros = 0

      data.each do |line|
        direction = line[0]
        rotation = line[1..-1].to_i
        rotation = -rotation if direction == 'L'
        dial = (dial + rotation) % 100
        zeros += 1 if dial == 0
      end

      zeros
    end

    def part_2
      dial = 50
      zeros = 0

      data.each do |line|
        direction = line[0]
        rotation = line[1..-1].to_i

        zeros += rotation / 100
        move = rotation % 100
        
        if direction == 'L'
          rotation = -rotation
          move = -move
        end

        line_dial = dial + move
        
        if dial != 0 and (line_dial < 0 or line_dial > 100)
          zeros += 1
        end

        dial = (dial + rotation) % 100
        zeros += 1 if dial == 0
      end

      zeros
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
