require 'spec_helper'
require 'string_calculator'

# http://osherove.com/tdd-kata-1/

describe StringCalculator do
  let(:calc) { StringCalculator.new }

  describe "#add" do
    context "given empty string" do
      it "returns 0" do
        expect(calc.add '').to equal 0
      end
    end
    context "given 1 number" do
      it "returns that number" do
        expect(calc.add '2').to equal 2
      end
    end
    context "given 2 numbers" do
      it "sums those numbers" do
        expect(calc.add '2,3').to equal 5
      end
      it "ignores non-integers" do
        expect(calc.add 'a,2').to equal 2
      end
    end
    context "given N numbers" do
      it "sums those numbers" do
        expect(calc.add '1,2,3,4,5,6,7,8,9,10').to equal 55
      end
    end
    context "given newline-separated inputs" do
      it "sums those numbers" do
        expect(calc.add "1\n2").to equal 3
      end
    end
    context "given comma- and newline-separated inputs" do
      it "sums those numbers" do
        expect(calc.add "1\n2,3").to equal 6
      end
    end
    context "with a defined delimiter" do
      it "sums the inputs" do
        expect(calc.add "//;\n1;2").to equal 3
      end
      it "can be of any length" do
        expect(calc.add "//***\n1***2***3").to equal 6
      end
    end

    context "with negatives" do
      it "raises an exception" do
        expect{calc.add "-1"}.to raise_error(ArgumentError)
      end
      it "outputs the negatives in the exception message" do
        expect{
          calc.add "-1,2,-3"
        }.to raise_error(ArgumentError, "Negatives not allowed: -1, -3")
      end
    end
  end

  describe "#extract_delimiter" do
    it "works" do
      expect(calc.extract_delimiter "//;\n1;2").to eq ";"
    end
  end
end

# Example with subject and "it should "
# I prefer the other form because
#  1) The spec is more explicit (we can generalize what's happening in the test)
#  2) The error message is thus more explicit as well
describe StringCalculator do
  subject { StringCalculator.new.add(input) }
  describe "#add" do
    context "given empty string" do
      let(:input) { '' }
      it { should equal 0 }
    end
  end
end
