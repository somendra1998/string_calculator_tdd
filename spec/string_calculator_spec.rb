require "rspec"
require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  describe ".add" do
    context "basic requirements" do
      it "returns 0 for an empty string" do
        expect(StringCalculator.add("")).to eq(0)
      end

      it "returns the number itself when only one number is provided" do
        expect(StringCalculator.add("5")).to eq(5)
      end

      it "returns sum of two comma-separated numbers" do
        expect(StringCalculator.add("1,2")).to eq(3)
      end

      it "returns sum of multiple comma-separated numbers" do
        expect(StringCalculator.add("1,2,3,4")).to eq(10)
      end
    end

    context "newlines as delimiters" do
      it "handles newlines as valid delimiters" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context "custom delimiters" do
      it "supports custom single-character delimiter" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end

      it "supports custom delimiter of any length" do
        expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
      end

      it "supports custom delimiter with special characters" do
        expect(StringCalculator.add("//[+*]\n1+*2+*3")).to eq(6)
      end
    end

    context "negative numbers" do
      it "raises an error for a single negative number" do
        expect { StringCalculator.add("1,-2,3") }.to raise_error("negatives not allowed: -2")
      end

      it "raises an error for multiple negative numbers" do
        expect { StringCalculator.add("1,-2,-3,4") }.to raise_error("negatives not allowed: -2, -3")
      end
    end

    context "numbers bigger than 1000" do
      it "ignores numbers greater than 1000" do
        expect(StringCalculator.add("2,1001")).to eq(2)
      end

      it "includes numbers up to 1000" do
        expect(StringCalculator.add("1000,1")).to eq(1001)
      end
    end

    context "mixed complex scenarios" do
      it "handles all other cases together" do
        expect(StringCalculator.add("//[***]\n1***2\n3,1001")).to eq(6)
      end
    end
  end
end
