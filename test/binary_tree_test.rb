# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

class BinaryTreeTest < Minitest::Test
  def test_initialize_complete_tree
    root = BinaryTree.with([0, 1, 2, 3, 4, 5, 6, 7])

    assert_equal(0, root.val)
    assert_equal(1, root.left.val)
    assert_equal(2, root.right.val)
    assert_equal(3, root.left.left.val)
    assert_equal(4, root.left.right.val)
    assert_equal(5, root.right.left.val)
    assert_equal(6, root.right.right.val)
    assert_equal(7, root.left.left.left.val)
  end

  def test_initialize_with_layer_by_layer_array
    root = BinaryTree.with([[0], [1, 2], [nil, nil, 5, 6]])

    assert_equal(0, root.val)
    assert_equal(1, root.left.val)
    assert_equal(2, root.right.val)
    assert_nil(root.left.left)
    assert_nil(root.left.right)
    assert_equal(5, root.right.left.val)
    assert_equal(6, root.right.right.val)
  end
end
