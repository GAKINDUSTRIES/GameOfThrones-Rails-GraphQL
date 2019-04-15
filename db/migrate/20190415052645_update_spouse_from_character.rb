class UpdateSpouseFromCharacter < ActiveRecord::Migration[5.2]
  def change
    remove_column :characters, :spouse
    add_reference :characters, :spouse
  end
end
