class ServantsController < ApplicationController
  protect_from_forgery :only => :none
  
  def index
    @servants = Servant.find(:all, :order => "host asc").sort{|servant, other| servant.name <=> other.name }
  end
  
  def edit
    @servant = Servant.find(params[:id])
  end
  
  def update
    @servant = Servant.find(params[:servant][:id])
    if @servant.update_attributes(params[:servant])
      redirect_to :action => :index
    else
      redirect_to :action => :edit, :id => params[:servant][:id]
    end
  end
  
  def redirect
    @servant = Servant.find(params[:id])
    @servant.update_attribute :clicks, @servant.clicks + 1
    render :layout => nil, :text => ""
    #redirect_to @servant.protocol+"://"+ @servant.host
  end
  
  def new
    @servant ||= Servant.new
  end
  
  def create
    @servant = Servant.create(params[:servant])
    if @servant.save
      redirect_to :controller => :main, :action => :index
    else
      redirect_to :action => :new
    end
  end
  
  def destroy
    Servant.destroy(params[:id])
    redirect_to :action => :index
  end
end
