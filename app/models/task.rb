class Task < ActiveRecord::Base
  has_and_belongs_to_many :before_tasks, :join_table => :before_tasks,
    :class_name => "Task", :foreign_key => 'task_id', :association_foreign_key => 'before_task_id'
  has_and_belongs_to_many :after_tasks, :join_table => :after_tasks, 
    :class_name => "Task", :foreign_key => 'task_id', :association_foreign_key => 'after_task_id'

  def full_code
    (before_tasks.collect(&:full_code) +
    [code] +
    after_tasks.collect(&:full_code)).join("\r\n")
  end

  def do
    result = eval(full_code)
    self.update_attribute :output, result.to_s
    self.update_attribute :done, true
  end
end
