# frozen_string_literal: true
module Year2025
  class Day07 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    Coord = Struct.new(:row, :col)
    Node  = Struct.new(:coord, :left, :right, :down, :seen)

    def valid_coord?(diagram, (row, col))
      row.between?(0, diagram.length - 1) and
      col.between?(0, diagram.first.length - 1)
    end

    def parse_diagram(diagram, coord, nodes_map, reuse = false)
      row = coord.row
      col = coord.col
      return unless valid_coord?(diagram, [row, col])

      val = diagram[row][col]
      node = nodes_map[coord] ||= Node.new(coord)

      case val
      when 'S', '.'
        diagram[row][col] = '|' if val == '.'
        next_coord = Coord.new(row + 1, col)
        node.down = next_coord
        parse_diagram(diagram, next_coord, nodes_map)

      when '^'
        left_coord  = Coord.new(row, col - 1)
        right_coord = Coord.new(row, col + 1)

        node.left  = left_coord
        node.right = right_coord

        unless reuse
          parse_diagram(diagram, left_coord, nodes_map)
          parse_diagram(diagram, right_coord, nodes_map)
        end
      end
    end



















    def count_timelines(coord, nodes_map)
      if coord and !nodes_map.key?(coord)
        return 1
      elsif coord
        node = nodes_map[coord]
        return count_timelines(node.left, nodes_map) +
          count_timelines(node.right, nodes_map) +
          count_timelines(node.down, nodes_map)
      else
        return 0
      end
    end


    def part_1
      data[:nodes_map]
        .each_value
        .select { |coord| coord.left and coord.right}
        .count
    end

    def part_2
      puts "booo......................."
      count_timelines(data[:root], data[:nodes_map])
    end


















    private
      # Processes each line of the input file and stores the result in the dataset
      # def process_input(line)
      #   line.map(&:to_i)
      # end

      # Processes the dataset as a whole
      def process_dataset(set)
        target = 'S'
        row_idx = set.index { |row| row.include?(target)}
        col_idx = set[row_idx].index(target)
        
        nodes_map = {}
        root = Coord.new(row: row_idx, col: col_idx)
        parse_diagram(set, root, nodes_map)

        nodes_map.each do |coord, node|
          left_coord  = node.left
          right_coord = node.right
          down_coord  = node.down

          puts "Node at #{coord.row};#{coord.col} => " \
              "left: #{left_coord&.row};#{left_coord&.col} " \
              "right: #{right_coord&.row};#{right_coord&.col} " \
              "down: #{down_coord&.row};#{down_coord&.col}"
        end

        { root: root, nodes_map: nodes_map }
      end
  end
end
