# == Schema Information
#
# Table name: characters
#
#  id        :bigint(8)        not null, primary key
#  aliases   :text             is an Array
#  name      :string           not null
#  born      :string
#  culture   :string
#  died      :string
#  gender    :integer          not null
#  playedBy  :text             is an Array
#  titles    :text             is an Array
#  father_id :bigint(8)
#  mother_id :bigint(8)
#  spouse_id :bigint(8)
#

FactoryBot.define do
  factory :character do
    aliases { [Faker::TvShows::GameOfThrones.character] }
    born    { 'Somewhere' }
    culture { 'Some culture' }
    died    { 'In 298 AC, at King\'s Landing' }
    gender  { 'Male' }
    name    { Faker::TvShows::GameOfThrones.character }
    titles  { ['Septa'] }
  end
end
