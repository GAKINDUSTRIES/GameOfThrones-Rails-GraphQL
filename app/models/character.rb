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

class Character < ApplicationRecord
  include Filterable

  enum gender: %i[Male Female]

  has_many :book_characters
  has_many :books, through: :book_characters

  has_many :house_characters
  has_many :allegiances, through: :house_characters, source: :house

  belongs_to :father, optional: true, class_name: 'Character'
  belongs_to :mother, optional: true, class_name: 'Character'
  belongs_to :spouse, optional: true, class_name: 'Character'

  validates :name, :gender, presence: true
end
