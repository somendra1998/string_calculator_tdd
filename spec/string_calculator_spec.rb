require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe "#add" do
    it "returns 0 for an empty string" do
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number itself if there's only one" do
      expect(calculator.add("4")).to eq(4)
    end

    it "returns the sum of two comma-separated numbers" do
      expect(calculator.add("1,2")).to eq(3)
    end

    it "returns the sum of multiple numbers" do
      expect(calculator.add("1,2,3,4")).to eq(10)
    end
    
  end
end
