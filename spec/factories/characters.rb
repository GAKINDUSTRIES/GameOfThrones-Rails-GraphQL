# == Schema Information
#
# Table name: characters
#
#  id          :bigint(8)        not null, primary key
#  aliases     :text             is an Array
#  allegiances :text             is an Array
#  name        :string           not null
#  born        :string
#  culture     :string
#  died        :string
#  father      :string
#  gender      :integer          not null
#  mother      :string
#  playedBy    :text             is an Array
#  spouse      :string
#  titles      :text             is an Array
#

FactoryBot.define do
  factory :character do
    aliases { [Faker::TvShows::GameOfThrones.character] }
    born    { 'Somewhere' }
    culture { 'Some culture' }
    died    { 'In 298 AC, at King\'s Landing' }
    father  { 'Eddard Stark' }
    gender  { 'Male' }
    mother  { 'Catelyn Stark' }
    name    { Faker::TvShows::GameOfThrones.character }
    titles  { ['Septa'] }
  end
end
