require File.dirname(__FILE__) + '/../spec_helper'

describe Servant do
  before(:each) do
    @servant = Servant.new
  end

  it "should be valid" do
    @servant.should be_valid
  end
end
