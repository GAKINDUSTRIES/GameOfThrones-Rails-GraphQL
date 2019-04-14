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

describe Book do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
