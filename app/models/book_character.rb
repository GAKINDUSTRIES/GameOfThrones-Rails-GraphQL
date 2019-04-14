class BookCharacter < ApplicationRecord
  belongs_to :book
  belongs_to :character
end
