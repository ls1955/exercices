# frozen_string_literal: true

require 'minitest/autorun'
require_relative './../lib/linked_list'

class LinkedListTest < Minitest::Test
  def test_create_new_linked_list
    head = LinkedList.new(0, [1, 2, 3, 4])
    expected = '0 -> 1 -> 2 -> 3 -> 4'

    assert_equal(expected, head.to_s)
  end

  def test_create_new_linked_list_with_class_method
    head = LinkedList.for(head_val: 0, follow_vals: [1, 2, 3, 4])
    expected = '0 -> 1 -> 2 -> 3 -> 4'

    assert_equal(expected, head.to_s)
  end
end
