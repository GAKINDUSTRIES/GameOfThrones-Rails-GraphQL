require 'rails_helper'

RSpec.describe Types::QueryType do
  set_graphql_type

  let(:context) { {} }
  let(:variables) { {} }
  let(:result) do
    res = GotRailsGraphqlSchema.execute(
      query_string,
      context: context,
      variables: variables
    )

    # Print any errors
    pp if res['errors']
    res
  end

  describe '#characters' do
    let!(:characters) { create_list(:character, 3) }
    let(:query_string) { %({ characters { edges { node { name } } } }) }
    let(:expected_characters) { result['data']['characters']['edges'] }

    it 'has a :characters field' do
      expect(subject).to have_field(:characters)
    end

    it 'return a list of characters' do
      expect(expected_characters.count).to eq 3
      expect(expected_characters.map { |character| character['node']['name'] })
        .to match_array(characters.pluck(:name))
    end
  end

  describe '#books' do
    let!(:books) { create_list(:book, 4) }
    let(:query_string) { %({ books { edges { node { name } } } }) }
    let(:expected_books) { result['data']['books']['edges'] }

    it 'has a :books field' do
      expect(subject).to have_field(:books)
    end

    it 'return a list of books' do
      expect(expected_books.count).to eq 4
      expect(expected_books.map { |book| book['node']['name'] })
        .to match_array(books.pluck(:name))
    end
  end

  describe '#houses' do
    let!(:houses) { create_list(:house, 5) }
    let(:query_string) { %({ houses { edges { node { name } } } }) }
    let(:expected_houses) { result['data']['houses']['edges'] }

    it 'has a :houses field' do
      expect(subject).to have_field(:houses)
    end

    it 'return a list of houses' do
      expect(expected_houses.count).to eq 5
      expect(expected_houses.map { |house| house['node']['name'] })
        .to match_array(houses.pluck(:name))
    end
  end
end
