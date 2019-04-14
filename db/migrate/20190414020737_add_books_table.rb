class AddBooksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :isbn
      t.text :authors, array: true
      t.integer :number_of_pages
      t.string :publisher
      t.string :country
      t.string :media_type
      t.string :released
    end
  end
end
