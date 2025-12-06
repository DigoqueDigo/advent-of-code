# frozen_string_literal: true
module Year2025
  class Day05 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      fresh_ids = 0

      data[:ids].each do |id|
        data[:ranges].each do |range|
          if range.include?(id)
            fresh_ids += 1
            break
          end
        end
      end

      fresh_ids
    end

    def part_2
      has_changed = true
      ranges = data[:ranges].sort_by(&:begin)

      while has_changed
        has_changed = false

        ranges.each_cons(2) do |a, b|
          if a.begin <= b.end and b.begin <= a.end
            ranges.delete(a)
            ranges.delete(b)

            r_end = [a.end, b.end].max
            r_begin = [a.begin, b.begin].min

            ranges.push((r_begin..r_end))
            ranges.sort_by!(&:begin)            
            has_changed = true
            break
          end
        end
      end

      ranges.map(&:count).sum
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      # def process_input(line)
      #   line.map(&:to_i)
      # end

      # Processes the dataset as a whole
      def process_dataset(set)
        id_list = []
        range_list = []
        switch_ar = false

        set.each do |line|
          switch_ar = true if line.length == 0
          if switch_ar
            id_list.push(line.to_i)
          else
            start_id, end_id = line.split('-').map(&:to_i)
            range_list.push(start_id..end_id)
          end
        end

        return { ranges: range_list, ids: id_list }
      end
  end
end
