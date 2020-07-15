# frozen_string_literal: true

# #each, #pop, #empty? and #to_a
# could also be replaced with a method_missing to delegate the method calls to @queue

# This use case is not suited for inheriting from Array because we only want select behaviour
# and the array behaviour really belongs to the @queue instance variable.
class Stack
  include Enumerable

  def initialize(max = 1000)
    @size = max
    @queue = []
  end

  def each(&block)
    @queue.each(&block)
  end

  def pop
    @queue.pop
  end

  def empty?
    @queue.empty?
  end

  def push(value)
    @queue.shift if full?
    @queue.push(value)
  end

  def full?
    @queue.size >= @size
  end

  def to_a
    @queue.to_a
  end

  def <<(value)
    push(value)
  end
end
