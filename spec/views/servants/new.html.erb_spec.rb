require File.dirname(__FILE__) + '/../../spec_helper'

describe "/servants/new" do
  before(:each) do
    assigns[:servant]= Servant.new
    render 'servants/new'
  end
  
  it "should have inputs" do
    response.should have_tag('input')
  end  
end
