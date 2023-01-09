# frozen_string_literal: true

require_relative './listnode'

# Linked List
class LinkedList
  def self.for(head_val: 0, vals: [])
    new(head_val, vals)
  end

  attr_accessor :head

  def initialize(head_val, vals)
    @head = ListNode.new(head_val)
    create_link(vals)
  end

  def create_link(vals)
    dummy = head

    vals.each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end
  end

  def to_s
    dummy = head
    string = ''

    while dummy&.nxt
      string << "#{dummy.val} -> "
      dummy = dummt.nxt
    end

    string << "#{dummy.val}"
  end
end
