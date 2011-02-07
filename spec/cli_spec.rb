require File.join(File.dirname(__FILE__), 'spec_helper')

include Rubbr::Cli

describe Rubbr::Cli do
  describe :executable? do

    it 'should return false for an nonexistent executable' do
      executable?(:nonexist4nt).should be_false
    end

    it 'should return true for an existent executable' do
      executable?(:diff).should be_true
    end
  end
end
