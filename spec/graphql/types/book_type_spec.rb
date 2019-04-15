require 'rails_helper'

RSpec.describe Types::BookType do
  set_graphql_type

  it 'has an :id field of ID type' do
    expect(subject).to have_field(:id)
    expect(subject.fields['id'].type.to_type_signature).to eq('ID!')
  end

  it 'has an :name field of String type' do
    expect(subject).to have_field(:name)
    expect(subject.fields['name'].type.to_type_signature).to eq('String!')
  end

  it 'has an :gender field of [Character!] type' do
    expect(subject).to have_field(:characters)
    expect(subject.fields['characters'].type.to_type_signature).to eq('[Character!]')
  end
end
