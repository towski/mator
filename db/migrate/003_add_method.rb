class AddMethod < ActiveRecord::Migration
  def self.up
    add_column :servants, :method, :string, :default => "get"
  end

  def self.down
    remove_column :servants, :method
  end
end
