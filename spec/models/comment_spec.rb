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

require 'rails_helper'

describe Comment do
  describe 'Associations' do
    it { is_expected.to belong_to(:commentable) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(50) }
    it { is_expected.to validate_presence_of(:comment) }
    it { is_expected.to validate_presence_of(:commentable) }
  end
end
