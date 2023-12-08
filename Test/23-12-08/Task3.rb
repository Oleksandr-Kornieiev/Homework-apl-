#Приклад з к.р.№1
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    raise NotImplementedError, "Subclasses must implement the 'speak' method"
  end
end

class Dog < Animal #успадкування
  def speak
    "Woof! My name is #{@name}."
  end
end

class Cat < Animal #успадкування
  def speak
    "Meow! My name is #{@name}."
  end
end

#поліморфізм, бо різні підкласи реалізують метод "speak" по-різному

dog = Dog.new("Max")
puts dog.speak
cat = Cat.new("Luna")
puts cat.speak