# == Schema Information
#
# Table name: book_characters
#
#  id           :bigint(8)        not null, primary key
#  book_id      :bigint(8)        not null
#  character_id :bigint(8)        not null
#

class BookCharacter < ApplicationRecord
  # Associations needs to be optional since association can be created even if
  # one of the entities has not been created yet.
  belongs_to :book, optional: true
  belongs_to :character, optional: true
end
