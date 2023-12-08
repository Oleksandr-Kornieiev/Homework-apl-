class Person
  attr_reader :name
  attr_writer :age
  attr_accessor :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end

person = Person.new("Max", 19, "Male")

# Використання методів для запису
# person.name = "Maks" # Буде помилка, оскільки немає методу для запису name
person.age = 20
person.gender = "Other"

# Використання методів для читання
puts "Name: #{person.name}"
# puts "Age: #{person.age}" # Буде помилка, оскільки немає методу для читання age
puts "Gender: #{person.gender}"
