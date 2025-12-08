# frozen_string_literal: true
module Year2025
  class Day08 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    JuncBox = Struct.new(:x, :y, :z)

    def calculate_distance(a, b)
      (a.x - b.x).abs2 +
      (a.y - b.y).abs2 +
      (a.z - b.z).abs2
    end

    def calculate_pairs(juncboxs)
      juncboxs.combination(2).map do |a, b|
        [a, b, calculate_distance(a, b)]
      end
    end

    def part_1
      circuits = {}
      circuits_lookup = {}

      juncboxs_pairs = calculate_pairs(data)
      juncboxs_pairs.sort_by! { | _, _, dist | -dist }

      data.each_with_index { |juncbox, idx| circuits[idx] = [juncbox] }
      data.each_with_index { |juncbox, idx| circuits_lookup[juncbox] = idx }

      (0...@iterations).each do |_|
        a, b, _ = juncboxs_pairs.pop
        a_cir_idx = circuits_lookup[a]
        b_cir_idx = circuits_lookup[b]

        if a_cir_idx != b_cir_idx
          circuits[a_cir_idx].concat(circuits[b_cir_idx])
          circuits[b_cir_idx].each { |juncbox| circuits_lookup[juncbox] = a_cir_idx}
          circuits.delete(b_cir_idx)
        end
      end

      circuits.values
        .sort_by { |juncboxs| -juncboxs.length}
        .map(&:length)
        .first(3)
        .reduce(1, :*)
    end

    def part_2
      nil
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      def process_input(line)
        x, y, z = line.split(',').map(&:to_i)
        JuncBox.new(x, y, z)
      end

      # Processes the dataset as a whole
      # def process_dataset(set)
      # end
  end
end
