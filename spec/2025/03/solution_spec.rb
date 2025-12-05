# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2025::Day03 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2025/03/input.txt")) }
  let(:example_input) {
    <<~EOF
      987654321111111
      811111111111119
      234234234234278
      818181911112111
    EOF
  }

  describe "part 1" do
    it "returns 357 for the example input" do
      expect(described_class.part_1(example_input)).to eq(357)
    end

    it "returns 17166 for my input" do
      expect(described_class.part_1(input)).to eq(17166)
    end
  end

  describe "part 2" do
    it "returns 3121910778619 for the example input" do
      expect(described_class.part_2(example_input)).to eq(3121910778619)
    end

    it "returns 169077317650774 for my input" do
      expect(described_class.part_2(input)).to eq(169077317650774)
    end
  end
end
