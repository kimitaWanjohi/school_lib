require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    @rentals << rental
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@title, @author]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end

  def to_hash
    {
      title: @title,
      author: @author
    }
  end
end
