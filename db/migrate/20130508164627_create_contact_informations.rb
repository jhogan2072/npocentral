class CreateContactInformations < ActiveRecord::Migration
  def change
    create_table :contact_informations do |t|
      t.string :contactable_type # the class of the object that is contactable, e.g. Employee
      t.integer :contactable_id
      t.string :type # Email, PhoneNumber, or Website
      t.string :label
      t.string :info

      t.timestamps
    end
  end
end
