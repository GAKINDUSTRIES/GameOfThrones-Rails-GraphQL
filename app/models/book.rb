# == Schema Information
#
# Table name: books
#
#  id              :bigint(8)        not null, primary key
#  name            :string           not null
#  isbn            :string
#  authors         :text             is an Array
#  number_of_pages :integer
#  publisher       :string
#  country         :string
#  media_type      :string
#  released        :string
#

class Book < ApplicationRecord
  include Filterable

  has_many :book_characters
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :characters, through: :book_characters

  validates :name, presence: true
end
