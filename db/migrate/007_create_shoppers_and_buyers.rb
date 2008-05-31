class CreateShoppersAndBuyers < ActiveRecord::Migration
  def self.up
  create_table "shoppers", :id => false, :force => true do |t|
    t.column "pass",       :string
    t.column "address1",   :string
    t.column "address2",   :string
    t.column "address3",   :string
    t.column "email",      :string
    t.column "user",       :string
    t.column "first_name", :string
    t.column "last_name",  :string
  end

  create_table "buyers", :id => false, :force => true do |t|
    t.column "customers_id",                 :integer
    t.column "purchased_without_account",    :boolean
    t.column "customers_gender",             :string
    t.column "customers_firstname",          :string
    t.column "customers_lastname",           :string
    t.column "customers_dob",                :datetime
    t.column "customers_email_address",      :string
    t.column "customers_default_address_id", :integer
    t.column "customers_telephone",          :string
    t.column "customers_fax",                :string
    t.column "customers_password",           :string
    t.column "customers_newsletter",         :string
    t.column "customers_group_name",         :string
    t.column "customers_group_id",           :integer
  end
  end

  def self.down
    drop_table :shoppers
    drop_table :buyers
  end
end

