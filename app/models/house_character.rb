# == Schema Information
#
# Table name: house_characters
#
#  id           :bigint(8)        not null, primary key
#  house_id     :bigint(8)        not null
#  character_id :bigint(8)        not null
#

class HouseCharacter < ApplicationRecord
  # Associations needs to be optional since association can be created even if
  # one of the entities has not been created yet.
  belongs_to :character, optional: true
  belongs_to :house, optional: true
end
