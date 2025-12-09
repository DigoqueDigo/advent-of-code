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

    def calculate_pairs(junc_boxes)
      junc_boxes.combination(2).map do |a, b|
        [a, b, calculate_distance(a, b)]
      end
    end

    def connect_junc_boxes(a, b, circuits, circuits_lookup)
      a_cir_idx = circuits_lookup[a]
      b_cir_idx = circuits_lookup[b]

      if a_cir_idx != b_cir_idx
        circuits[a_cir_idx].concat(circuits[b_cir_idx])
        circuits[b_cir_idx].each { |juncbox| circuits_lookup[juncbox] = a_cir_idx}
        circuits.delete(b_cir_idx)
      end
    end

    def part_1
      (0...@iterations).each do |_|
        a, b, _ = data[:junc_boxes_pairs].pop
        connect_junc_boxes(a, b, data[:circuits], data[:circuits_lookup])
      end

      data[:circuits].values
        .sort_by { |junc_boxes| -junc_boxes.length}
        .map(&:length)
        .first(3)
        .reduce(1, :*)
    end

    def part_2
      a, b = nil, nil
      while data[:circuits].size > 1
        a, b, _ = data[:junc_boxes_pairs].pop
        connect_junc_boxes(a, b, data[:circuits], data[:circuits_lookup])
      end
      a.x * b.x
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      # def process_input(line)
      #   x, y, z = line.split(',').map(&:to_i)
      #   JuncBox.new(x, y, z)
      # end

      # Processes the dataset as a whole
      def process_dataset(set)
        circuits = {}
        circuits_lookup = {}

        junc_boxes = set.map.with_index do |line, idx|
          x, y, z = line.split(',').map(&:to_i)
          junc_box = JuncBox.new(x, y, z)

          circuits[idx] = [junc_box]
          circuits_lookup[junc_box] = idx
          junc_box
        end

        {
          circuits: circuits,
          circuits_lookup: circuits_lookup,
          junc_boxes_pairs: calculate_pairs(junc_boxes)
            .sort_by{ | _, _, dist | -dist },
        }
      end
  end
end
