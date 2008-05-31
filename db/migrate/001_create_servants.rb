class CreateServants < ActiveRecord::Migration
  def self.up
    create_table :servants do |t|
      t.timestamps
      t.string :host
      t.string :protocol
      t.string :user
      t.string :password
      t.string :magic
    end
  end

  def self.down
    drop_table :servants
  end
end
