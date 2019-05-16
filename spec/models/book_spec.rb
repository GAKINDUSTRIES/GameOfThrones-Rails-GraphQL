# == Schema Information
#
# Table name: books
#
#  id              :bigint(8)        not null, primary key
#  name            :string           not null
#  isbn            :string
#  authors         :text             is an Array
#  number_of_pages :integer
#  publisher       :string
#  country         :string
#  media_type      :string
#  released        :string
#
require 'rails_helper'

describe Book do
  describe 'Associations' do
    it { is_expected.to have_many(:book_characters) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:characters).through(:book_characters) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
