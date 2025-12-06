# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2025::Day05 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2025/05/input.txt")) }
  let(:example_input) {
    <<~EOF
      3-5
      10-14
      16-20
      12-18

      1
      5
      8
      11
      17
      32
    EOF
  }

  describe "part 1" do
    it "returns 3 for the example input" do
      expect(described_class.part_1(example_input)).to eq(3)
    end

    it "returns 885 for my input" do
      expect(described_class.part_1(input)).to eq(885)
    end
  end

  describe "part 2" do
    it "returns 14 for the example input" do
      expect(described_class.part_2(example_input)).to eq(14)
    end

    it "returns 348115621205535 for my input" do
      expect(described_class.part_2(input)).to eq(348115621205535)
    end
  end
end
