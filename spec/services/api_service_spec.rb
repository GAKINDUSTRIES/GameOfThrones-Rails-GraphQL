require 'rails_helper'

describe ApiService do
  describe 'Services' do
    let(:page) { 1 }

    describe '#get_books' do
      it 'returns an array of books' do
        expect { ApiService.send(:get_books, :page) }
          .not_to raise_error
        expect(ApiService.send(:get_books, :page)[0]).to match_json_schema('book')
      end
    end

    describe '#get_houses' do
      it 'returns an array of houses' do
        expect { ApiService.send(:get_houses, :page) }
          .not_to raise_error
        expect(ApiService.send(:get_houses, :page)[0]).to match_json_schema('house')
      end
    end

    describe '#get_characters' do
      it 'returns an array of characters' do
        expect { ApiService.send(:get_characters, :page) }
          .not_to raise_error
        expect(ApiService.send(:get_characters, :page)[0]).to match_json_schema('character')
      end
    end
  end
end
