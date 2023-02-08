# frozen_string_literal: true

require 'minitest/autorun'
require_relative './../lib/linked_list'

# Some tests for linked list wrapper
class LinkedListTest < Minitest::Test
  def test_linked_list_with_vals
    head = LinkedList.with([0, 1, 2, 3, 4])
    expected = '0 -> 1 -> 2 -> 3 -> 4'

    assert_equal(expected, head.to_s)
  end

  def test_travel_linked_list
    head = LinkedList.with([0, 1])

    assert_equal(0, head.val)
    assert_equal(1, head.nxt.val)
  end

  def test_linked_list_vals
    head = LinkedList.with([1, 2, 3, 4, 5])
    vals = [1, 2, 3, 4, 5]

    assert_equal(vals, head.vals)
  end
end
