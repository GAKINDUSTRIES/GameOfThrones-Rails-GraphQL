class AddBookCharacterTable < ActiveRecord::Migration[5.2]
  def change
    create_table :book_characters do |t|
      t.references :book, null: false
      t.references :character, null: false
    end
  end
end
