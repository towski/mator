#!/opt/local/bin/ruby

ENV['RAILS_ENV'] = 'development'
require File.dirname(__FILE__) + '/config/environment'
puts "Starting tasks"
tasks = Task.find(:all, :conditions => ["done = ? and time < ?", false, Time.now])
puts "Performing #{tasks.size} tasks:" + tasks.map(&:name).join(",")
tasks.each(&:do)
