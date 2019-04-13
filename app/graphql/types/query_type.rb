module Types
  class QueryType < Types::BaseObject
    field :characters, Types::CharacterType.connection_type, null: false
    
    def characters
      Character.all
    end
  end
end
