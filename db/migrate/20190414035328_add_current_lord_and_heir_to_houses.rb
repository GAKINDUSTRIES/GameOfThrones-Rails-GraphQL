class AddCurrentLordAndHeirToHouses < ActiveRecord::Migration[5.2]
  def change
    add_reference :houses, :current_lord
    add_reference :houses, :heir
  end
end
