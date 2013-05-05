class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :name, :null => false
      t.text :description
      t.datetime :event_date

      t.timestamps
    end
  end
end
