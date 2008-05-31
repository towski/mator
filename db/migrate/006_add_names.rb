class AddNames < ActiveRecord::Migration
  def self.up
    add_column :servants, :name, :string
  end

  def self.down
    remove_column :servants, :name
  end
end
