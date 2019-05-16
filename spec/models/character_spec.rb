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
#  played_by :text             is an Array
#  titles    :text             is an Array
#  father_id :bigint(8)
#  mother_id :bigint(8)
#  spouse_id :bigint(8)
#

require 'rails_helper'

describe Character do
  describe 'Associations' do
    it { is_expected.to have_many(:house_characters) }
    it { is_expected.to have_many(:allegiances).through(:house_characters) }

    it { is_expected.to have_many(:book_characters) }
    it { is_expected.to have_many(:books).through(:book_characters) }

    it { is_expected.to have_many(:comments).dependent(:destroy) }

    it { is_expected.to belong_to(:father) }
    it { is_expected.to belong_to(:mother) }
    it { is_expected.to belong_to(:spouse) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:gender) }
  end

  describe '.filter_by' do
    before { create_list :character, 3 }

    context 'when no filter are provided' do
      it 'returns all the characters' do
        expect(described_class.filter_by({}))
          .to match_array Character.all
      end
    end

    context 'when filters are passed' do
      let(:name) { { name: 'Tony Stark' } }
      let(:name_and_culture) { name.merge(culture: 'Marvel Comics') }

      context 'when one filter is passed' do
        let!(:expected_character) { create :character, name }

        it 'should return all records that match the filter' do
          expect(described_class.filter_by(name)).to match_array [expected_character]
        end
      end

      context 'when multiple filters are passed' do
        let!(:expected_character) { create :character, name_and_culture }
        let!(:not_expected_character) { create :character, name }

        it 'should return all records that match all the filters' do
          expect(described_class.filter_by(name_and_culture)).to match_array [expected_character]
        end
      end
    end
  end
end
