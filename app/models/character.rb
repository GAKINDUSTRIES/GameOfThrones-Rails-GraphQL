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

  validates :name, :gender, presence: true

  scope :filter_by, ->(args) { args.present? ? where(args) : all }
end
