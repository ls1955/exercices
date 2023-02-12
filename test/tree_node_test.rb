# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'
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

  def test_node_equality
    node = TreeNode.new(0)
    node2 = TreeNode.new(0)
    left_node = TreeNode.new(1)
    right_node = TreeNode.new(2)

    assert_equal(true, node == node2)

    node.append_left(left_node).append_right(right_node)

    assert_equal(false, node == node2)
    assert_equal(false, node == 1)
    assert_equal(false, node == 'tuna')
    assert_equal(false, node == :ham)
    assert_equal(false, node == [])
    assert_equal(false, node == {})

    node2.append_left(left_node).append_right(right_node)

    assert_equal(true, node == node2)
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

  def test_node_level_traversal
    root = BinaryTree.with([[0], [1, 2], [3, 4, 5, 6]])
    result = []

    root.each_level_arr { |level| result << level.map(&:val) }

    assert_equal([[0], [1, 2], [3, 4, 5, 6]], result)
  end

  def test_node_level_traversal_with_index
    root = BinaryTree.with([[0], [1, 2], [3, 4, 5, 6]])
    result = []

    root.each_level_arr_with_index do |level, index|
      result << level.map { |node| node.val * index }
    end

    assert_equal([[0], [1, 2], [6, 8, 10, 12]], result)
  end

  def test_fetch_node_in_tree
    root = BinaryTree.with([[1], [2, 3], [4, 5, 6, 7]])
    node1 = root.fetch(1)
    node2 = root.fetch(2)
    node7 = root.fetch(7)

    assert_equal(1, node1.val)
    assert_equal(2, node1.left.val)
    assert_equal(3, node1.right.val)
    assert_equal(2, node2.val)
    assert_equal(4, node2.left.val)
    assert_equal(5, node2.right.val)
    assert_equal(7, node7.val)
    assert_nil(node7.left)
    assert_nil(node7.right)
  end

  def test_node_height
    root1 = BinaryTree.with([1])
    root2 = BinaryTree.with([[1], [2, 3]])
    root3 = BinaryTree.with([[1], [2, 3], [4, 5, 6, 7]])
    root4 = BinaryTree.with([[1], [2, 3], [4, 5, 6, 7], [8]])

    assert_equal(1, root1.height)
    assert_equal(2, root2.height)
    assert_equal(3, root3.height)
    assert_equal(4, root4.height)
  end

  def test_node_is_a_leaf_node
    root = BinaryTree.with([[1], [2, 3], [4]])

    assert_equal(false, root.leaf?)
    assert_equal(false, root.left.leaf?)
    assert_equal(true, root.right.leaf?)
    assert_equal(true, root.left.left.leaf?)
  end
end
