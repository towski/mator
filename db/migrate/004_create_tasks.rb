class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.timestamps
      t.text :code
      t.string :name
      t.text :output
      t.datetime :time
      t.boolean :done, :default => false
      t.integer :base_id
    end
  end

  def self.down
    drop_table :tasks
  end
end
