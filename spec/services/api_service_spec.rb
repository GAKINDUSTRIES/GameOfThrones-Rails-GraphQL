require 'rails_helper'

describe ApiService do
  describe 'Services' do
    let(:page) { 1 }
    let(:api_service) { ApiService.new }

    describe '#get_books' do
      it 'returns an array of books' do
        expect { api_service.get_books(page) }
          .not_to raise_error
        expect(api_service.get_books(page)[0]).to match_json_schema('book')
      end
    end

    describe '#get_houses' do
      it 'returns an array of houses' do
        expect { api_service.get_houses(page) }
          .not_to raise_error
        expect(api_service.get_houses(page)[0]).to match_json_schema('house')
      end
    end

    describe '#get_characters' do
      it 'returns an array of characters' do
        expect { api_service.get_characters(page) }
          .not_to raise_error
        expect(api_service.get_characters(page)[0]).to match_json_schema('character')
      end
    end
  end
end
