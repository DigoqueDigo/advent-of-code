# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2025::Day12 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2025/12/input.txt")) }
  let(:example_input) {
    <<~EOF
      0:
      ###
      ##.
      ##.

      1:
      ###
      ##.
      .##

      2:
      .##
      ###
      ##.

      3:
      ##.
      ###
      ##.

      4:
      ###
      #..
      ###

      5:
      ###
      .#.
      ###

      4x4: 0 0 0 0 2 0
      12x5: 1 0 1 0 2 2
      12x5: 1 0 1 0 3 2
    EOF
  }

  describe "part 1" do
    it "returns 3 for the example input" do
      expect(described_class.part_1(example_input)).to eq(3)
    end

    it "returns 469 for my input" do
      expect(described_class.part_1(input)).to eq(469)
    end
  end

  describe "part 2" do
    it "returns nil for the example input" do
      expect(described_class.part_2(example_input)).to eq(nil)
    end

    it "returns nil for my input" do
      expect(described_class.part_2(input)).to eq(nil)
    end
  end
end
