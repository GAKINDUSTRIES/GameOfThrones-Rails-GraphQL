module Types
  class HouseType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :region, String, null: true
    field :coat_of_arms, String, null: true
    field :words, String, null: true
    field :titles, [String], null: true
    field :authors, [String], null: true
    field :overlord, Types::HouseType, null: true
    field :founder, Types::CharacterType, null: true
    field :founded, String, null: true
    field :died_out, String, null: true
    field :ancestral_weapons, String, null: true
    field :cadet_branches, String, null: true
    field :current_lord, Types::CharacterType, null: true
    field :heir, Types::CharacterType, null: true
    field :house_characters, [Types::CharacterType], null: true
  end
end
