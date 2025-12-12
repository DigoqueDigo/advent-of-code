# frozen_string_literal: true
require 'glpk'
require 'opt-rb'

module Year2025
  class Day10 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def press_button(lights, button)
      new_lights = lights.dup
      button.each { |idx| new_lights[idx] = !new_lights[idx] }
      new_lights
    end

    def ligths_smaller_config(target, buttons)
      visited = Set.new
      visited << Array.new(target.length, false)
      queue = [[Array.new(target.length, false), 0]]

      until queue.empty?
        state, presses = queue.shift
        return presses if state == target

        buttons.each do |button|
          new_state = press_button(state, button)
          next if visited.include?(new_state)

          visited << new_state
          queue << [new_state, presses + 1]
        end
      end

      nil
    end

    def joltage_smaller_config(joltages, buttons)
      prob = Opt::Problem.new
      vars = buttons.each_index.map do |i|
        Opt::Integer.new(0.., "x#{i}")
      end

      joltages.each_with_index do |target, counter_idx|
        expr = vars.each_with_index.sum do |var, button_idx|
          button = buttons[button_idx]
          var * (button.include?(counter_idx) ? 1 : 0)
        end
        prob.add(expr == target)
      end

      prob.minimize(vars.sum)
      prob.solve(solver: :glpk)
      vars.sum(&:value)
    end

    def part_1
      data.map do |machine|
        ligths_smaller_config(
          machine[:lights], 
          machine[:buttons])
      end.sum
    end

    def part_2
      data.map do |machine|
        joltage_smaller_config(
        machine[:joltage], 
        machine[:buttons])
      end.sum
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      def process_input(line)
        parts = line.split(' ')

        lights = parts.shift[1...-1]
          .each_char.map { |c| c == '#' }

        joltage = parts.pop[1...-1]
          .split(',')
          .map(&:to_i)

        buttons = parts
          .take_while { |p| p.start_with?('(') }
          .map { |b| b[1...-1].split(',').map(&:to_i) }

        {
          lights:  lights,
          buttons: buttons,
          joltage: joltage,
        }
      end

      # Processes the dataset as a whole
      # def process_dataset(set)
      #   set
      # end
  end
end
