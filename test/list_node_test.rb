# frozen_string_literal: true

require 'minitest/autorun'
require_relative './../lib/listnode'

# test for list node
class ListNodeTest < Minitest::Test
  def test_a_new_created_node_without_argument
    node = ListNode.new

    assert_equal(0, node.val)
    assert_nil(node.nxt)
  end

  def test_a_new_created_node_with_value
    node = ListNode.new(1_000)

    assert_equal(1_000, node.val)
    assert_nil(node.nxt)
  end

  def test_initialize_node_connect_with_another_node
    node_second = ListNode.new(2)
    node_first = ListNode.new(1, node_second)

    assert_equal(node_second, node_first.nxt)
  end

  def test_a_node_connect_with_another_node
    node_first = ListNode.new(1)
    node_second = ListNode.new(2)
    node_first.nxt = node_second

    assert_equal(node_second, node_first.nxt)
  end
end
