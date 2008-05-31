class AddPerson < ActiveRecord::Migration
  def self.up
    create_table "people" do |t|
      t.column "type",       :string
      t.column "address1",   :string
      t.column "address2",   :string
      t.column "address3",   :string
      t.column "email",      :string
      t.column "healthy_glow", :float
      t.column "skill", :float
      t.column "name", :string
      t.column "ips", :string
      t.column "last_name",  :string
    end
    
    create_table "people_people", :id => false do |t|
      t.column :first_person_id, :integer
      t.column :second_person_id, :integer
    end
  end

  def self.down
    drop_table :people
    drop_table :people_people
  end
end

