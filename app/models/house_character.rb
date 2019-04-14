# == Schema Information
#
# Table name: house_characters
#
#  id           :bigint(8)        not null, primary key
#  house_id     :bigint(8)        not null
#  character_id :bigint(8)        not null
#

class HouseCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :house
end
