class LoveInterest < ActiveRecord::Base
  self.table_name = "people_people"
  
  def interest
    first_person.healthy_glow / second_person.healthy_glow
  end
end