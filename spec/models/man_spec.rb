require File.dirname(__FILE__) + '/../spec_helper'

describe Man do
  before(:each) do
    @diana = Woman.new(:name => "diana", :healthy_glow => 0.42, :skill => 0.25)
    @matt = Man.new(:name => "matt", :healthy_glow => 0.4, :skill => 0.3)
    @ellen = Woman.new(:name => "ellen", :healthy_glow => 0.25, :skill => 0.25)
    @paris = Woman.new(:name => "paris", :healthy_glow => 0.99, :skill => 0.99)
    @cari = Woman.new(:name => "cari", :healthy_glow => 0.5, :skill => 0.5)
  end
  
  describe "will aquiesce" do 
    it "to a woman if similar" do
      @matt.aquiesce?(@diana).should == true
    end
  end
  
  describe "won't aquiesce" do
    it "if a woman isn't healthy enough" do
      @matt.aquiesce?(@ellen).should == false
    end
    
    it "to a woman if someone better is on their radar" do
      @cari.make_advance(@matt)
      @matt.current_interest.should == @cari
      @matt.aquiesce?(@diana).should be_false
    end
  end

  describe "making an advance" do
    it "loses appeal if he is spurned" do
      @matt.make_advance @paris
      @matt.healthy_glow.to_s.should == 0.38.to_s
    end

    it "gains healthy glow is he hits on someone above him and they agree" do
      @matt.make_advance @diana
      @matt.healthy_glow.to_s.should == 0.41.to_s
    end

    it "gains skill from being successful" do
      @matt.make_advance @diana
      @matt.skill.to_s.should == 0.31.to_s
    end
  end

  
  it "gains healthy glow if someone above him makes an advance and is successful" do
    @diana.make_advance @matt
    @matt.healthy_glow.to_s.should == 0.41.to_s
  end
end
