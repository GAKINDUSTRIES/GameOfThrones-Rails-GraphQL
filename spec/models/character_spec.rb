require 'rails_helper'

describe Character do
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
      let(:name_and_father) { name.merge(father: 'Howard Stark') }

      context 'when one filter is passed' do
        let!(:expected_character) { create :character, name }

        it 'should return all records that match the filter' do
          expect(described_class.filter_by(name)).to match_array [expected_character]
        end
      end

      context 'when multiple filters are passed' do
        let!(:expected_character) { create :character, name_and_father }
        let!(:not_expected_character) { create :character, name }

        it 'should return all records that match all the filters' do
          expect(described_class.filter_by(name_and_father)).to match_array [expected_character]
        end
      end
    end
  end
end
