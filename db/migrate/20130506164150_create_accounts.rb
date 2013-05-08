class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, :null => false
      t.text :description
      t.string :full_domain, :null => false

      t.timestamps
    end
  end
end
