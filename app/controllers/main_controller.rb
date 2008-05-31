class MainController < ApplicationController
  def index
	  @servants = Servant.find(:all).sort{|servant, other| servant.name <=> other.name }
	  @tasks = Task.find(:all)
	  @to_do = Task.find(:all, :conditions => {:done => false}, :order => :time)
  end
end