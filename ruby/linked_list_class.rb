class List
  include Enumerable

  ListElem = Struct.new(:obj, :prev, :next)

  def initialize(*enum)
    @head = @tail = ListElem.new
    @head.next = @head
    @head.prev = @head

    (enum.size == 1 && Enumerable === enum[0] ? enum[0] : enum).each {|e| append e}
  end

  def append(e)
    tmp = ListElem.new e, @tail.prev, @tail
    tmp.prev.next = tmp
    tmp.next.prev = tmp
    self
  end

  alias :<< :append

  # prepend, remove etc.

  def display_elem
    i = @head.next

    while @tail != i
      yield i.obj
      i = i.next
    end
  end

end

mike = List.new
mike.append("red")
mike.append("orange")
mike.append("yellow")

puts mike.display_elem {|e| puts e} 
