# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree and a node, find the
  level order successor of the given node
  in the tree. The level order successor is
  the node that appears right after the given
  node in the level order traversal.
STATEMENT

# Solution
class Solution
  def solution(root, target)
    return nil unless root

    queue = [root]

    until queue.empty?
      node = queue.shift

      queue << node.left if node.left
      queue << node.right if node.right

      break if node == target
    end
    queue[0]
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([1, 2, 3, 4, 5])
    node = root.fetch(3)
    solution = Solution.new.solution(root, node)
    expected = root.fetch(4)

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[1], [7, 1], [nil, 9, 10, 5]])
    node = root.fetch(9)
    solution = Solution.new.solution(root, node)
    expected = root.fetch(10)

    assert_equal(expected, solution)
  end

  def test_case3
    root = BinaryTree.with([[12], [7, 1], [nil, 9, 10, 5]])
    node = root.fetch(12)
    solution = Solution.new.solution(root, node)
    expected = root.fetch(7)

    assert_equal(expected, solution)
  end

  def test_case4
    root = nil
    node = nil
    solution = Solution.new.solution(root, node)

    assert_nil(solution)
  end

  def test_case5
    root = BinaryTree.with([[1], [2, 3], [4, 5, 6, 7]])
    node = root.fetch(7)
    solution = Solution.new.solution(root, node)

    assert_nil(solution)
  end
end
