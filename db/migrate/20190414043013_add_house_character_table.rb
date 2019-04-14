class AddHouseCharacterTable < ActiveRecord::Migration[5.2]
  def change
    create_table :house_characters do |t|
      t.references :house, null: false
      t.references :character, null: false
    end
  end
end
