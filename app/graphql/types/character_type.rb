module Types
  class CharacterType < BaseObject
    field :id, ID, null: false
    field :aliases, [String], null: true
    field :allegiances, [String], null: true
    field :name, String, null: false
    field :born, String, null: true
    field :culture, String, null: true
    field :died, String, null: true
    field :gender, String, null: false
    field :played_by, [String], null: true
    field :spouse, String, null: true
    field :titles, [String], null: true
  end
end
