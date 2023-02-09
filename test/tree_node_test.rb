# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/tree_node'

class TreeNodeTest < Minitest::Test
  def test_initialize_without_argument
    head = TreeNode.new

    assert_equal(-1, head.val)
    assert_nil(head.left)
    assert_nil(head.right)
  end

  def test_initialize_with_argument
    left_node = TreeNode.new(1)
    right_node = TreeNode.new(3)
    head = TreeNode.new(2, left_node, right_node)

    assert_equal(2, head.val)
    assert_equal(left_node, head.left)
    assert_equal(right_node, head.right)
  end

  def test_append_left_node
    head = TreeNode.new(2)
    left_node = TreeNode.new(1)

    head.append_left(left_node)

    assert_equal(left_node, head.left)
  end

  def test_append_right_node
    head = TreeNode.new(2)
    right_node = TreeNode.new(3)

    head.append_right(right_node)

    assert_equal(right_node, head.right)
  end

  def test_chain_append_nodes
    left_node = TreeNode.new(1)
    head = TreeNode.new(2)
    right_node = TreeNode.new(3)

    head.append_left(left_node).append_right(right_node)

    assert_equal(left_node, head.left)
    assert_equal(right_node, head.right)
  end
end