# Оголошення модулю Printable
module Printable
  def print_info
    # Виводить назву класу поточного об'єкта
    puts "Клас: #{self.class}"
    # Виводить унікальний ідентифікатор поточного об'єкта
    puts "Ідентифікатор: #{self.object_id}"
    # Створює хеш attributes, де ключами є імена змінних екземпляра,
    # а значеннями — їхні значення
    attributes = {}
    self.instance_variables.each do |variable|
      attributes[variable] = self.instance_variable_get(variable)
    end
    # Виводить атрибути об'єкта у вигляді хешу
    puts "Атрибути: #{attributes}"
  end
end
# Оголошення класу Person, який включає модуль Printable
class Person
  include Printable
  # Конструктор класу, приймає ім'я та вік об'єкта
  def initialize(name, age)
    @name = name
    @age = age
  end
end
# Створення екземпляра класу Person
person = Person.new("Alex", 19)
# Виклик методу print_info, який доданий завдяки модулю Printable
person.print_info