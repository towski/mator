class Person < ActiveRecord::Base
  serialize :ips, Array
  has_and_belongs_to_many :people, :foreign_key => "first_person_id", :association_foreign_key => "second_person_id"
  
  def initialize *args
    super *args
    self.ips = []
    save!
  end
  
  def tolerance_of_difference 
    1.0 - healthy_glow
  end

  def make_advance(person)
    if person.aquiesce? self
      self.skill += (person.healthy_glow - healthy_glow) * 0.5
      self.healthy_glow += (person.healthy_glow - healthy_glow) * 0.5
      love_interest(person)
      save!
      true
    else
      self.healthy_glow -= 0.02
      save!
      false
    end
  end

  def appeal
    healthy_glow + skill
  end
  
  def love_interest(person)
    LoveInterest.find_by_first_person_id_and_second_person_id(id, person.id) ||
    LoveInterest.find_by_first_person_id_and_second_person_id(person.id, id) ||
    LoveInterest.create!(:first_person_id => id, :second_person_id => person.id)
  end

  def aquiesce? person
    if current_interest and current_interest.appeal > person.appeal
      false
    else
      difference_in_healthy_glow = healthy_glow - person.healthy_glow 
      if difference_in_healthy_glow <=  0 
        self.healthy_glow += (difference_in_healthy_glow.abs ) * 0.5
        love_interest(person)
        true
      elsif difference_in_healthy_glow < 0.05
        love_interest(person)
        true
      else false
      end
    end
  end

  def current_interest
    people.reload.max do |first_person, second_person|
      first_person.healthy_glow <=> second_person.healthy_glow
    end
  end
end
