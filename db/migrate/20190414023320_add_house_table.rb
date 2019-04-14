class AddHouseTable < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name, null: false
      t.string :region
      t.string :coat_of_arms
      t.string :words
      t.text :titles, array: true
      t.text :authors, array: true
      t.references :overlord
      t.references :founder
      t.string :founded
      t.string :died_out
      t.text :ancestral_weapons, array: true
      t.text :cadet_branches, array: true
    end
  end
end
