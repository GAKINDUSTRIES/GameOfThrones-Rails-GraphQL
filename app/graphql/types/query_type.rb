module Types
  class QueryType < Types::BaseObject
    field :characters, Types::CharacterType.connection_type, null: false do
      argument :id, String, required: false
      argument :culture, String, required: false
      argument :father, String, required: false
      argument :gender, String, required: false
      argument :mother, String, required: false
      argument :name, String, required: false
    end

    def characters(**args)
      Character.filter_by(args)
    end
  end
end
