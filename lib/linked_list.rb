# frozen_string_literal: false

require_relative './listnode'

# Linked List
class LinkedList
  def self.with(vals = [])
    head = ListNode.new(vals[0])
    create_link!(head, vals[1..])
    head
  end

  def self.create_link!(head, vals)
    dummy = head
    vals.each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end
    head
  end
end
