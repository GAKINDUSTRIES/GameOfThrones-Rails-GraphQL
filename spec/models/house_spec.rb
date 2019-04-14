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

require 'rails_helper'

describe House do
  describe 'Associations' do
    it { is_expected.to have_many(:house_characters) }
    it { is_expected.to have_many(:allegiances).through(:house_characters) }
    it { is_expected.to belong_to(:current_lord).class_name('Character') }
    it { is_expected.to belong_to(:founder).class_name('Character') }
    it { is_expected.to belong_to(:heir).class_name('Character') }
    it { is_expected.to belong_to(:overlord).class_name('House') }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
