require './person'

# This class is responsible for storing information about a student
class Student < Person
  def initialize(classroom, age, name: 'unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hook
    '¯\(ツ)/¯'
  end
end