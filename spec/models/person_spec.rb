require File.dirname(__FILE__) + '/../spec_helper'

describe Person do
  it "can be stored in the database" do
    akash = Person.create! :name => "Akash"
    Person.exists?(akash).should be_true
  end
  
  it "can have multiple ips" do
    akash = Man.create! :name => "Akash"
    akash.ips << "1.2.3.4"
    akash.save!
    Person.find(akash.id).ips.should == ["1.2.3.4"]
  end
  
  it "should query hostip.info for location information" do
    akash = Person.create! :name => "Akash", :ips => ["1.2.3.4"]
    Rest::HostIpInfo.should_receive(:find)
    akash.location
  end
end