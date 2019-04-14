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

class Character < ApplicationRecord
  enum gender: %i[Male Female]

  has_many :book_characters
  has_many :books, through: :book_characters

  has_many :house_characters
  has_many :allegiances, through: :house_characters, source: :house

  belongs_to :mother, optional: true, class_name: 'Character'
  belongs_to :father, optional: true, class_name: 'Character'

  validates :name, :gender, presence: true

  scope :filter_by, ->(args) { args.present? ? where(args) : all }
end
