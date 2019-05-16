module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :comment, String, null: false
    field :created_at, DateTime, null: false
  end
end
