require_relative 'person'

# This class is responsible for storing information about a teacher
class Teacher < Person
  def initialize(age, name, specialization, parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
