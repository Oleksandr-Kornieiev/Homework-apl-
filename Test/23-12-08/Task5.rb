class Node
  attr_accessor :key, :left, :right

  def initialize(key)
    @key = key
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(key)
    node = Node.new(key)
    if @root.nil?
      @root = node
    else
      current = @root
      while true
        if key < current.key
          if current.left.nil?
            current.left = node
            break
          else
            current = current.left
          end
        else
          if current.right.nil?
            current.right = node
            break
          else
            current = current.right
          end
        end
      end
    end
  end

  def pre_order_traversal(node = @root, depth = 0, prefix = "ROOT: ")
    return if node.nil?

    puts "#{"  " * depth}#{prefix}#{node.key}"
    pre_order_traversal(node.left, depth + 1, "L#{prefix}")
    pre_order_traversal(node.right, depth + 1, "R#{prefix}")
  end

  def post_order_traversal(node = @root, depth = 0, prefix = "ROOT: ")
    return if node.nil?

    post_order_traversal(node.left, depth + 1, "L#{prefix}")
    post_order_traversal(node.right, depth + 1, "R#{prefix}")
    puts "#{"  " * depth}#{prefix}#{node.key}"
  end

  def find(key)
    if @root.nil?
      return nil
    else
      current = @root
      while !current.nil?
        if key == current.key
          return current
        elsif key < current.key
          current = current.left
        else
          current = current.right
        end
      end
      return nil
    end
  end
end

def main
  tree = BinaryTree.new
  display_menu
  loop do
    puts "Виберіть дію:"
    choice = STDIN.gets.chomp.to_i
    case choice
    when 1
      key = STDIN.gets.chomp.to_i
      tree.insert(key)
    when 2
      puts "Інфіксний обхід:"
      puts "У розробці"
    when 3
      puts "Префіксний обхід:"
      tree.pre_order_traversal
    when 4
      puts "Постфіксний обхід:"
      tree.post_order_traversal
    when 5
      key = STDIN.gets.chomp.to_i
      node = tree.find(key)
      if node.nil?
        puts "Елемент не знайдено"
      else
        puts "Знайдений елемент: #{node.key}"
      end
    when 6
      break
    end
  end
end

def display_menu
  puts "1. Вставити елемент"
  puts "2. Перейти по інфіксному обходу"
  puts "3. Перейти по префіксному обходу"
  puts "4. Перейти по постфіксному обходу"
  puts "5. Знайти елемент"
  puts "6. Вийти"
end

main