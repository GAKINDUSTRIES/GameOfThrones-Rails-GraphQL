require 'rails_helper'

RSpec.describe Types::QueryType do
  set_graphql_type

  let!(:characters) { create_list(:character, 3) }

  describe '#characters' do
    it 'has a :characters field' do
      expect(subject).to have_field(:characters)
    end    

    it 'return a list of characters' do
      pending("check how to execute resolve function for characters field")
      fail
    end
  end
end
