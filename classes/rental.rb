require_relative 'person'
require_relative 'book'

class Rental
  attr_accessor :date, :person, :book, :id

  def initialize(date, person, book, id)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
    @id = id || generate_id
  end

  def generate_id
    rand(1..1000)
  end
end
