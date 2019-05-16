# == Schema Information
#
# Table name: comments
#
#  id               :bigint(8)        not null, primary key
#  title            :string(50)       default(""), not null
#  comment          :text             not null
#  commentable_type :string           not null
#  commentable_id   :bigint(8)        not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :comment do
    title { Faker::Lorem.sentence(3) }
    comment { Faker::Lorem.paragraph }

    association :commentable, factory: %i[book character].sample
  end
end
