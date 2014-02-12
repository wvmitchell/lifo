class Lifo

  attr_reader :queue

  def initialize(max_size=nil)
    @max_size = max_size if max_size
    @queue = []
  end

  def push(element)
    queue.push element
  end

  def size
    queue.length
  end

  def pop(elements=nil)
    elements ? queue.pop(elements) : queue.pop
  end

  def clear
    @queue.clear
  end

  def peek
    queue[-1]
  end

end
