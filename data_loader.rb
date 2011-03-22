#!/usr/bin/ruby
# This script dumps a csv of all leaf nodes
ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
puts "Loading #{ENV['RAILS_ENV']} environment."

require File.dirname(__FILE__) + '/config/environment'

i = 0
f = File.open("db/data/buyers.yml")
data = YAML::load(f.read).to_a
data.each do |name,hash| 
  i += 1
#  Buyer.create! hash
  if i % 1000 == 0
    puts "#{i} buyers"
  end
end
i = 0
f = File.open("db/data/shoppers.yml")
data = YAML::load(f.read).to_a
data.each do |name,hash| 
  i += 1
  Shopper.create! hash
  if i % 1000 == 0
    puts "#{i} shoppers"
  end
end

puts "hey"
