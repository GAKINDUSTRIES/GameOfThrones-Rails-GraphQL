class RemoveMotherAndFatherFromCharacterTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :characters, :father
    remove_column :characters, :mother

    add_reference :characters, :father
    add_reference :characters, :mother
  end
end
