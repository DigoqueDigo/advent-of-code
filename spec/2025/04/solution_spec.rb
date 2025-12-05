# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2025::Day04 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2025/04/input.txt")) }
  let(:example_input) {
    <<~EOF
      ..@@.@@@@.
      @@@.@.@.@@
      @@@@@.@.@@
      @.@@@@..@.
      @@.@@@@.@@
      .@@@@@@@.@
      .@.@.@.@@@
      @.@@@.@@@@
      .@@@@@@@@.
      @.@.@@@.@.
    EOF
  }

  describe "part 1" do
    it "returns 13 for the example input" do
      expect(described_class.part_1(example_input)).to eq(13)
    end

    it "returns 1419 for my input" do
      expect(described_class.part_1(input)).to eq(1419)
    end
  end

  describe "part 2" do
    it "returns 43 for the example input" do
      expect(described_class.part_2(example_input)).to eq(43)
    end

    it "returns 8739 for my input" do
      expect(described_class.part_2(input)).to eq(8739)
    end
  end
end
