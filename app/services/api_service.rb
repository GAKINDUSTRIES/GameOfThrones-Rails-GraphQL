# rubocop:disable all
require 'httparty'
require 'uri'

class ApiService
  include HTTParty

  ENDPOINT = 'https://anapioficeandfire.com/api'.freeze
  PAGE_SIZE = 50

  def self.download_characters
    character_page = 1
    loop do
      characters = get_characters(character_page)
      break if characters.empty?
      characters.each do |character|
        create_character(character)
      end
      character_page += 1
    end
  end

  def self.download_houses
    house_page = 1
    loop do
      houses = get_houses(house_page)
      break if houses.empty?
      houses.each do |house|
        create_house(house)
      end
      house_page += 1
    end
  end

  def self.download_books
    book_page = 1
    loop do
      books = get_books(book_page)
      break if books.empty?
      books.each do |book|
        create_book(book)
      end
      book_page += 1
    end
  end

  def self.get_books(page = 1)
    books_url = "#{ENDPOINT}/books?page=#{page}&pageSize=#{PAGE_SIZE}"
    HTTParty.get(books_url).parsed_response
  end

  def self.get_characters(page = 1)
    characters_url = "#{ENDPOINT}/characters?page=#{page}&pageSize=#{PAGE_SIZE}"
    HTTParty.get(characters_url).parsed_response
  end

  def self.get_houses(page = 1)
    houses_url = "#{ENDPOINT}/houses?page=#{page}&pageSize=#{PAGE_SIZE}"
    HTTParty.get(houses_url).parsed_response
  end

  def self.entity_id(url)
    URI(url).path.split('/').last
  end

  def self.create_character(character)
    character_name = character['name']
    return if character_name.empty?
    hash = {
      id: entity_id(character['url']),
      name: character_name,
      aliases: character['aliases'],
      born: character['born'],
      culture: character['culture'],
      died: character['died'],
      gender: character['gender'],
      played_by: character['playedBy'],
      titles: character['titles'],
      father_id: entity_id(character['father']),
      mother_id: entity_id(character['mother']),
      spouse_id: entity_id(character['spouse']),

    }
    Character.create! hash
  end

  def self.create_house(house)
    house_name = house['name']
    return if house_name.empty?
    hash = {
      id: entity_id(house['url']),
      name: house_name,
      region: house['region'],
      coat_of_arms: house['coatOfArms'],
      words: house['words'],
      titles: house['titles'],
      overlord_id: entity_id(house['overlord']),
      founder_id: entity_id(house['founder']),
      founded: house['founded'],
      died_out: house['diedOut'],
      ancestral_weapons: house['ancestralWeapons'],
      cadet_branches: house['cadetBranches'],
      current_lord_id: entity_id(house['currentLord']),
      heir_id: entity_id(house['heir']),
    }
    new_house = House.create! hash
    house['swornMembers'].each do |character_url|
      HouseCharacter.create! house_id: new_house.id,
                             character_id: entity_id(character_url)
    end
  end

  def self.create_book(book)
    book_name = book['name']
    return if book_name.empty?
    hash = {
      id: entity_id(book['url']),
      name: book_name,
      isbn: book['isbn'],
      authors: book['authos'],
      number_of_pages: book['numberOfPages'],
      publisher: book['publisher'],
      country: book['country'],
      media_type: book['mediaType'],
      released: book['released']
    }
    new_book = Book.create! hash
    book['characters'].each do |character_url|
      BookCharacter.create! book_id: new_book.id,
                            character_id: entity_id(character_url)
    end
  end

  private_class_method :get_books,
                       :get_characters,
                       :get_houses,
                       :entity_id,
                       :create_book,
                       :create_house,
                       :create_character
end
