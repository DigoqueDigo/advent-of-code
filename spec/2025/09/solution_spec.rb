# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2025::Day09 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2025/09/input.txt")) }
  let(:example_input) {
    <<~EOF
      7,1
      11,1
      11,7
      9,7
      9,5
      2,5
      2,3
      7,3
    EOF
  }

  describe "part 1" do
    it "returns 50 for the example input" do
      expect(described_class.part_1(example_input)).to eq(50)
    end

    it "returns 4781546175 for my input" do
      expect(described_class.part_1(input)).to eq(4781546175)
    end
  end

  describe "part 2" do
    it "returns 24 for the example input" do
      expect(described_class.part_2(example_input)).to eq(24)
    end

    it "returns 1573359081 for my input" do
      expect(described_class.part_2(input)).to eq(1573359081)
    end
  end
end
