require File.dirname(__FILE__) + '/../spec_helper'

describe ServantsController do
  describe "GET 'index'" do
    it "should be successful" do
      Servant.create :link => "potpouri.com"
      get 'index'
      response.should be_success
      assigns(:servants).size.should eql(1)
    end
  end
end
