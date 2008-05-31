class CreateBeforeAndAfterTasks < ActiveRecord::Migration
  def self.up
    create_table :before_tasks, :id => false do |t|
      t.integer :task_id
      t.integer :before_task_id
    end

    create_table :after_tasks, :id => false do |t|
      t.integer :task_id
      t.integer :after_task_id
    end
  end

  def self.down
    drop_table :before_tasks
    drop_table :after_tasks
  end
end
