require 'rails_helper'

RSpec.describe Types::HouseType do
  set_graphql_type

  it 'has an :id field of ID type' do
    expect(subject).to have_field(:id)
    expect(subject.fields['id'].type.to_type_signature).to eq('ID!')
  end

  it 'has an :name field of String type' do
    expect(subject).to have_field(:name)
    expect(subject.fields['name'].type.to_type_signature).to eq('String!')
  end

  it 'has an :overlord field of String type' do
    expect(subject).to have_field(:overlord)
    expect(subject.fields['overlord'].type.to_type_signature).to eq('House')
  end

  it 'has an :founder field of String type' do
    expect(subject).to have_field(:founder)
    expect(subject.fields['founder'].type.to_type_signature).to eq('Character')
  end

  it 'has an :current_lord field of String type' do
    expect(subject).to have_field(:currentLord)
    expect(subject.fields['currentLord'].type.to_type_signature).to eq('Character')
  end

  it 'has an :heir field of String type' do
    expect(subject).to have_field(:heir)
    expect(subject.fields['heir'].type.to_type_signature).to eq('Character')
  end

  it 'has an :house_characters field of String type' do
    expect(subject).to have_field(:houseCharacters)
    expect(subject.fields['houseCharacters'].type.to_type_signature).to eq('[Character!]')
  end
end
