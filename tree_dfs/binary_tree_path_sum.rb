# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree and a target, find if
  the tree has a path from root-to-leaf such
  that the sum of all the node values of that
  path equals target.
STATEMENT

# Solution
class Solution
  def solution(root, target_sum)
    return false unless root

    stack = [[root, root.val]]

    until stack.empty?
      node, curr_sum = stack.pop

      return true if node.leaf? && curr_sum == target_sum

      stack << [node.left, curr_sum + node.left.val] if node.left
      stack << [node.right, curr_sum + node.right.val] if node.right
    end
    false
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([1, 2, 3, 4, 5, 6, 7])
    solution = Solution.new.solution(root, 10)
    expected = true

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[12], [7, 1], [nil, 9, 10, 5]])
    solution = Solution.new.solution(root, 23)
    expected = true

    assert_equal(expected, solution)
  end

  def test_case3
    root = BinaryTree.with([[12], [7, 1], [nil, 9, 10, 5]])
    solution = Solution.new.solution(root, 16)
    expected = false

    assert_equal(expected, solution)
  end

  def test_case4
    root = nil
    solution = Solution.new.solution(root, 10)
    expected = false

    assert_equal(expected, solution)
  end
end
