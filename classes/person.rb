require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    @rentals << rental
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age && @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def generate_id
    rand(1_000..9_999)
  end
end
