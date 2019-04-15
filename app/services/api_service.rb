require 'httparty'

class ApiService
  include HTTParty

  ENDPOINT = 'https://anapioficeandfire.com/api'.freeze
  PAGE_SIZE = 50

  def initialize(); end

  def get_books(page = 1)
    books_url = "#{ENDPOINT}/books?page=#{page}&pageSize=#{PAGE_SIZE}"
    HTTParty.get(books_url).parsed_response
  end

  def get_characters(page = 1)
    characters_url = "#{ENDPOINT}/characters?page=#{page}&pageSize=#{PAGE_SIZE}"
    HTTParty.get(characters_url).parsed_response
  end

  def get_houses(page = 1)
    houses_url = "#{ENDPOINT}/houses?page=#{page}&pageSize=#{PAGE_SIZE}"
    HTTParty.get(houses_url).parsed_response
  end
end
