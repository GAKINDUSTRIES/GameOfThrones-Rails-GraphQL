require 'rails_helper'

RSpec.describe Types::QueryType do
  set_graphql_type

  describe '#characters' do
    let!(:characters) { create_list(:character, 3) }

    it 'has a :characters field' do
      expect(subject).to have_field(:characters)
    end

    it 'return a list of characters' do
      pending('check how to execute resolve function for characters field')
      raise
    end
  end

  describe '#books' do
    let!(:books) { create_list(:book, 3) }

    it 'has a :books field' do
      expect(subject).to have_field(:books)
    end

    it 'return a list of books' do
      pending('check how to execute resolve function for books field')
      raise
    end
  end
end
