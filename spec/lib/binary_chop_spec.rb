require 'spec_helper'
require 'binary_chop'
require 'binary_chop_recursive'

# http://codekata.com/kata/kata02-karate-chop/

def chopper
  # @chopper ||= BinaryChop.new
  @chopper ||= BinaryChopRecursive.new
end

RSpec::Matchers.define :be_chop_of do |integer, array|
  match do |expected|
    chop(integer, array) == expected
  end

  failure_message do |expected|
    "expected that #{expected} would be the index of #{integer} in #{array} - but got #{chop(integer, array)}" 
  end

  failure_message_when_negated do |expected|
    "expected that #{expected} would not be the index of #{integer} in #{array}" 
  end

  def chop(int, array)
    chopper.chop(int, array)
  end

end

describe "Binary chop" do

  describe -1 do
    it { should be_chop_of(3, []) }
    it { should be_chop_of(3, [1]) }
    it { should be_chop_of(0, [1, 3, 5]) }
    it { should be_chop_of(2, [1, 3, 5]) }
    it { should be_chop_of(4, [1, 3, 5]) }
    it { should be_chop_of(6, [1, 3, 5]) }
    it { should be_chop_of(0, [1, 3, 5, 7]) }
    it { should be_chop_of(2, [1, 3, 5, 7]) }
    it { should be_chop_of(4, [1, 3, 5, 7]) }
    it { should be_chop_of(6, [1, 3, 5, 7]) }
    it { should be_chop_of(8, [1, 3, 5, 7]) }
  end

  describe 0 do
    it { should be_chop_of(1, [1]) }
    it { should be_chop_of(1, [1, 3, 5]) }
    it { should be_chop_of(1, [1, 3, 5, 7]) }
  end

  describe 1 do
    it { should be_chop_of(3, [1, 3, 5]) }
    it { should be_chop_of(3, [1, 3, 5, 7]) }
  end

  describe 2 do
    it { should be_chop_of(5, [1, 3, 5]) }
    it { should be_chop_of(5, [1, 3, 5, 7]) }
  end

  describe 3 do
    it { should be_chop_of(7, [1, 3, 5, 7]) }
  end
end
