class TasksController < ApplicationController
  def index
    @tasks = Task.find(:all)
	  @to_do = Task.find(:all, :conditions => ["done = ? and time > ?", false, Time.now])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  def create
    @task = Task.new(params[:task])
    respond_to do |format|
      if @task.save
        flash[:notice] = 'Task was successfully created.'
        format.html { redirect_to(:controller => :main, :action => :index) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def dupe
    to_be_cloned = Task.find(params[:id])
    @task = to_be_cloned.clone
    @task.before_tasks = to_be_cloned.before_tasks
    @task.after_tasks = to_be_cloned.after_tasks
    @task.time = Time.now
    @task.done = false
    render :action => :new
  end
  
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        flash[:notice] = 'Task was successfully updated.'
        format.html { redirect_to(:controller => :main, :action => :index) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def schedule
    task = Task.find(params[:id])
    task.update_attributes :done => false, :time => Time.now
    redirect_to :controller => :main, :action => :index
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to(:controller => :main, :action => :index) }
      format.xml  { head :ok }
    end
  end
end
