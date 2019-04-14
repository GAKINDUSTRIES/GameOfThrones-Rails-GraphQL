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

FactoryBot.define do
  factory :book do
    name            { Faker::Book.title }
    isbn            { Faker::Code.isbn }
    number_of_pages { Random.rand(1..1000) }
    publisher       { Faker::Name.name }
    country         { Faker::Address.country }
  end
end
