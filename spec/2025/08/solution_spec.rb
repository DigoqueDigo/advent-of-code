# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2025::Day08 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2025/08/input.txt")) }
  let(:example_input) {
    <<~EOF
      162,817,812
      57,618,57
      906,360,560
      592,479,940
      352,342,300
      466,668,158
      542,29,236
      431,825,988
      739,650,466
      52,470,668
      216,146,977
      819,987,18
      117,168,530
      805,96,715
      346,949,466
      970,615,88
      941,993,340
      862,61,35
      984,92,344
      425,690,689
    EOF
  }

  describe "part 1" do
    it "returns 40 for the example input" do
      expect(described_class.part_1(example_input, 10)).to eq(40)
    end

    it "returns 80446 for my input" do
      expect(described_class.part_1(input, 1000)).to eq(80446)
    end
  end

  describe "part 2" do
    # it "returns nil for the example input" do
    #   expect(described_class.part_2(example_input)).to eq(nil)
    # end

    # it "returns nil for my input" do
    #   expect(described_class.part_2(input)).to eq(nil)
    # end
  end
end
