require 'rails_helper'

RSpec.describe Types::CharacterType do
  set_graphql_type

  it 'has an :id field of ID type' do
    expect(subject).to have_field(:id)
    expect(subject.fields['id'].type.to_type_signature).to eq('ID!')
  end

  it 'has an :name field of String type' do
    expect(subject).to have_field(:name)
    expect(subject.fields['name'].type.to_type_signature).to eq('String!')
  end

  it 'has an :gender field of [String!] type' do
    expect(subject).to have_field(:gender)
    expect(subject.fields['gender'].type.to_type_signature).to eq('String!')
  end

  it 'has an :spouse field of Character type' do
    expect(subject).to have_field(:spouse)
    expect(subject.fields['spouse'].type.to_type_signature).to eq('Character')
  end

  it 'has an :father field of Character type' do
    expect(subject).to have_field(:father)
    expect(subject.fields['father'].type.to_type_signature).to eq('Character')
  end

  it 'has an :mother field of Character type' do
    expect(subject).to have_field(:mother)
    expect(subject.fields['mother'].type.to_type_signature).to eq('Character')
  end
end
