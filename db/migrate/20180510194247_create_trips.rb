class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.string :city
      t.string :activity
      t.text :description

      t.timestamps
    end
  end
end
