class AddCharacterModel < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.text :aliases, array: true
      t.text :allegiances, array: true
      t.string :name, null: false
      t.string :born
      t.string :culture
      t.string :died
      t.string :father
      t.integer :gender, null: false
      t.string :mother
      t.text :playedBy, array: true
      t.string :spouse
      t.text :titles, array: true
    end  
  end
end
