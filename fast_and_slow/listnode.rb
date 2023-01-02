# frozen_string_literal: false

# node in linked list
class LinkedNode
  attr_accessor :val, :next_node

  def initialize(val = 0, next_node = nil)
    @val = val
    @next_node = next_node
  end
end
