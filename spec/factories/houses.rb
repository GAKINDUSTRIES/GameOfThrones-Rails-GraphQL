# == Schema Information
#
# Table name: houses
#
#  id                :bigint(8)        not null, primary key
#  name              :string           not null
#  region            :string
#  coat_of_arms      :string
#  words             :string
#  titles            :text             is an Array
#  authors           :text             is an Array
#  overlord_id       :integer
#  founder_id        :integer
#  founded           :string
#  died_out          :string
#  ancestral_weapons :text             is an Array
#  cadet_branches    :text             is an Array
#

FactoryBot.define do
  factory :house do
    name   { Faker::Book.title }
    region { Faker::Address.city }
    words  { Faker::Lorem.sentence }
  end
end
