require File.dirname(__FILE__) + '/../../spec_helper'

describe "/servants/index" do
  before(:each) do
    @link =  "http://www.awesomesite.com"
    james = Servant.new :link => @link
    assigns[:servants] = [james]
    render 'servants/index'
  end
  
  it "should have a list of servants" do
    response.should have_tag("li", /#{@link}/)
  end
end
