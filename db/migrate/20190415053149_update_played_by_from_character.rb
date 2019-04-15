class UpdatePlayedByFromCharacter < ActiveRecord::Migration[5.2]
  def change
    rename_column :characters, :playedBy, :played_by
  end
end
