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

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :title, presence: true, length: { maximum: 50 }
  validates :comment, presence: true
  validates :commentable, presence: true
end
