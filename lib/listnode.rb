# frozen_string_literal: false

# node in linked list
class ListNode
  attr_accessor :val, :nxt

  def initialize(val = 0)
    @val = val
    @nxt = nxt
  end

  def reverse
    node = self
    prev = nil

    node.nxt, prev, node = prev, node, node.nxt while node

    prev
  end

  def to_s
    result = val.to_s
    each { |node| result << " -> #{node.val}" }
    result
  end

  def vals
    result = [val]
    each { |node| result << node.val }
    result
  end

  private

  def each
    dummy = nxt

    while dummy
      yield dummy if block_given?
      dummy = dummy.nxt
    end

    self
  end
end
