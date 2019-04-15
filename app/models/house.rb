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
#  overlord_id       :bigint(8)
#  founder_id        :bigint(8)
#  founded           :string
#  died_out          :string
#  ancestral_weapons :text             is an Array
#  cadet_branches    :text             is an Array
#  current_lord_id   :bigint(8)
#  heir_id           :bigint(8)
#

class House < ApplicationRecord
  include Filterable

  has_many :house_characters
  has_many :allegiances, through: :house_characters, source: :character

  belongs_to :current_lord, class_name: 'Character', optional: true
  belongs_to :founder, class_name: 'Character', optional: true
  belongs_to :heir, class_name: 'Character', optional: true
  belongs_to :overlord, class_name: 'House', optional: true

  validates :name, presence: true
end
