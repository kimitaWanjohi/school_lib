require_relative 'decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    # capitalize the first letter of the name
    @nameable.correct_name.capitalize
  end
end
