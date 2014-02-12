gem 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require_relative '../lib/lifo'

class LifoTest < MiniTest::Test

  attr_reader :lifo

  def setup
    @lifo = Lifo.new
  end

  def test_it_adds_element_with_push
    lifo.push(1)
    assert_equal 1, lifo.size
    assert_equal [1], lifo.queue
  end

  def test_it_adds_multiple_elements
    lifo.push(1)
    lifo.push(2)
    assert_equal 2, lifo.size
    assert_equal [1,2], lifo.queue
  end

  def test_it_pops_off_the_queue
    lifo.push(1)
    lifo.push(2)
    assert_equal 2, lifo.pop
  end

  def test_queue_is_correctly_altered_when_popped
    lifo.push(1)
    lifo.push(2)
    lifo.push(3)
    assert_equal 3, lifo.pop
    assert_equal [1,2], lifo.queue
  end

  def test_queue_can_be_cleared
    lifo.push(1)
    lifo.push(2)
    lifo.push(3)
    assert_equal 3, lifo.size
    lifo.clear
    assert_equal 0, lifo.size
  end

  def test_next_to_be_popped_can_be_peeked
    lifo.push(1)
    lifo.push(2)
    lifo.push(3)
    assert_equal 3, lifo.peek
    assert_equal 3, lifo.size
  end

  def test_can_pop_multiple_at_once
    lifo.push(1)
    lifo.push(2)
    lifo.push(3)
    assert_equal [2,3], lifo.pop(2)
    assert_equal [1], lifo.queue
  end

  def test_can_have_a_max_size
    @lifo = Lifo.new(2)
    lifo.push(1)
    lifo.push(2)
    #assert_raises Exception::QueueFullException, lifo.push(3)
  end

end
