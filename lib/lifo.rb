require 'forwardable'

class Lifo
  extend Forwardable

  attr_reader :queue
  def_delegators :queue, :push, :size, :pop, :clear

  def initialize(max_size=nil)
    @queue = []
  end

  def peek
    queue[-1]
  end

end
