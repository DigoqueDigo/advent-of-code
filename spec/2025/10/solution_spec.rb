# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2025::Day10 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2025/10/input.txt")) }
  let(:example_input) {
    <<~EOF
      [.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
      [...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
      [.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
    EOF
  }

  describe "part 1" do
    it "returns 7 for the example input" do
      expect(described_class.part_1(example_input)).to eq(7)
    end

    it "returns 428 for my input" do
      expect(described_class.part_1(input)).to eq(428)
    end
  end

  describe "part 2" do
    it "returns 33 for the example input" do
      expect(described_class.part_2(example_input)).to eq(33)
    end

    it "returns 16613 for my input" do
      expect(described_class.part_2(input)).to eq(16613)
    end
  end
end
