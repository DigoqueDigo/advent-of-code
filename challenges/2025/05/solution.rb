# frozen_string_literal: true
module Year2025
  class Day05 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data[:ids].count do |id|
        data[:ranges].any? do |range|
          range.include?(id)
        end
      end
    end

  def part_2
    merged = []
    sorted = data[:ranges].sort_by(&:begin)

    sorted.each do |range|
      if merged.empty? || merged.last.end < range.begin
        merged << range
      else
        merged[-1] = merged.last.begin..[merged.last.end, range.end].max
      end
    end

    merged.sum { |range| range.count }
  end

    private
      # Processes each line of the input file and stores the result in the dataset
      # def process_input(line)
      #   line.map(&:to_i)
      # end

      # Processes the dataset as a whole
      def process_dataset(set)
        split_index = set.index('')
        ranges = set[0...split_index]
        ids = set[(split_index + 1)..-1]

        ranges.map! do |line|
          start_id, end_id = line.split('-').map(&:to_i)
          start_id..end_id
        end

        ids.map!(&:to_i)

        { ranges: ranges, ids: ids }
      end
  end
end
