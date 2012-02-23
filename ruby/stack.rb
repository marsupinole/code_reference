class Stack

  def initialize
   @the_stack = []
  end

  def push(item)
    @the_stack.push item
  end

  def pop
    @the_stack.pop
  end

  def front
    @the_stack.shift
  end

  def count
    @the_stack.length
  end
  def clear
    @the_stack.clear
  end

  def look
    @the_stack.last
  end
  
  stack = Stack.new
  stack.push('abc')
  stack.push(100)
  puts stack.count
  puts stack.look
  puts stack.front
  puts stack.count
  stack.clear
  puts stack.count
  
end
