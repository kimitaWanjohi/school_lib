require 'json'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/rental'
require_relative 'classes/ui_class'
require_relative 'classes/list_class'
require_relative 'classes/create_class'
class App
  attr_accessor :books, :people, :rentals

  def initialize
    created_books_file = create_new_json('books')
    @books = created_books_file ? JSON.parse(created_books_file.read, create_additions: true) : []
    created_people_file = create_new_json('people')
    @people = created_people_file ? JSON.parse(created_people_file.read, create_additions: true) : []
    created_rent_file = create_new_json('rentals')
    @rentals = created_rent_file ? JSON.parse(created_rent_file.read, create_additions: true) : []
    @list_elements = ListElements.new(@books, @people, @rentals)
    @creale_elements = CreateElements.new(@books, @people, @rentals)
  end

  def create_new_json(file_name)
    File.write("./#{file_name}.json", []) unless File.exist?("./#{file_name}.json")
    File.open("./#{file_name}.json", 'r')
  end

  def exit_app
    puts 'Exiting the application. Goodbye!'
    exit
  end

  def apply_option(option)
    actions = {
      '1' => @list_elements.method(:list_all_books),
      '2' => @list_elements.method(:list_all_people),
      '3' => @creale_elements.method(:create_person),
      '4' => @creale_elements.method(:create_book),
      '5' => @creale_elements.method(:create_rental),
      '6' => @list_elements.method(:list_rentals_by_id),
      '7' => method(:exit_app)
    }
    action = actions[option]
    if action
      action.call
    else
      puts 'You have to select one of the options'
    end
  end

  def run
    ui = UI.new
    ui.welcome
    loop do
      ui.options
      option = gets.chomp
      apply_option(option)
    end
  end

  def keeping_data
    File.open('./people.json', 'w+') do |file|
      people = JSON.dump(@people)
      file.write(people)
    end
    File.open('./rentals.json', 'w+') do |file|
      rentals = JSON.dump(@rentals)
      file.write(rentals)
    end
    File.open('./books.json', 'w+') do |file|
      books = JSON.dump(@books)
      file.write(books)
    end
  end
end
