module Types
  class BookType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :isbn, String, null: true
    field :authors, [String], null: true
    field :number_of_pages, Integer, null: true
    field :publisher, String, null: true
    field :country, String, null: true
    field :media_type, String, null: true
    field :released, String, null: true
    field :characters, [Types::CharacterType], null: true
  end
end
