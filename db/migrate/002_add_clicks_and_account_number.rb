class AddClicksAndAccountNumber < ActiveRecord::Migration
  def self.up
    add_column :servants, :clicks, :integer, :default => 0
    add_column :servants, :account_number, :string
  end

  def self.down
    remove_column :servants, :clicks
    remove_column :servants, :account_number
  end
end
