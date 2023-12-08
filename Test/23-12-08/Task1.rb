# Клас Visitor визначає інтерфейс для відвідувача, який має методи для обробки різних типів UI-елементів.
class Visitor
  def visit_button(button)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def visit_textbox(textbox)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Клас UIRenderer є конкретним відвідувачем і реалізує методи для рендерингу кнопок і текстових полів.
class UIRenderer < Visitor
  def visit_button(button)
    puts "Render button: #{button.label}"
  end

  def visit_textbox(textbox)
    puts "Render textbox: #{textbox.placeholder}"
  end
end

# Клас UIElement є базовим класом для всіх UI-елементів і визначає метод accept для прийняття відвідувача.
class UIElement
  def accept(visitor)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Клас Button є конкретним UI-елементом і реалізує метод accept для виклику відповідного методу відвідувача.
class Button < UIElement
  attr_accessor :label

  def accept(visitor)
    visitor.visit_button(self)
  end
end

# Клас TextBox є конкретним UI-елементом і реалізує метод accept для виклику відповідного методу відвідувача.
class TextBox < UIElement
  attr_accessor :placeholder

  def accept(visitor)
    visitor.visit_textbox(self)
  end
end

# Створення конкретних екземплярів Button і TextBox.
button = Button.new
button.label = "Click me"

textbox = TextBox.new
textbox.placeholder = "Enter text here"

# Створення екземпляра UIRenderer, який буде відвідувачем для рендерингу UI-елементів.
renderer = UIRenderer.new

# Виклик методів accept для об'єктів Button і TextBox, які викликають відповідні методи відвідувача.
button.accept(renderer)
textbox.accept(renderer)