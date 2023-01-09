# frozen_string_literal: false

# node in linked list
class ListNode
  attr_accessor :val, :nxt

  def initialize(val = 0)
    @val = val
    @nxt = nxt
  end

  def connect(node)
    nxt = node
  end
end
