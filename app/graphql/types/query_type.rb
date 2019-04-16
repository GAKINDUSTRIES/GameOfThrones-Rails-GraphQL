module Types
  class QueryType < Types::BaseObject
    field :characters, Types::CharacterType.connection_type, null: false do
      argument :id, String, required: false
      argument :culture, String, required: false
      argument :gender, String, required: false
      argument :name, String, required: false
    end

    field :books, Types::BookType.connection_type, null: false do
      argument :id, String, required: false
      argument :name, String, required: false
    end

    field :houses, Types::HouseType.connection_type, null: false do
      argument :id, String, required: false
      argument :name, String, required: false
      argument :region, String, required: false
    end

    def characters(**args)
      Character.filter_by(args)
    end

    def books(**args)
      Book.filter_by(args)
    end

    def houses(**args)
      House.filter_by(args)
    end
  end
end
