class RemoveAllegiancesFromCharacterTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :characters, :allegiances
  end
end
