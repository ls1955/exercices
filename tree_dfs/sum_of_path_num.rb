# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree where each node can only
  have a digit (0-9) value, each root-to-leaf
  path will represent a number. Find the total
  sum of all the numbers represented by all paths.
STATEMENT

# Solution
class Solution
  def solution(root)
    return 0 unless root

    stack = [[root, 0]]
    result = 0

    until stack.empty?
      node, curr_sum = stack.pop
      curr_sum = (curr_sum * 10) + node.val

      result += curr_sum if node.leaf?
      stack << [node.left, curr_sum] if node.left
      stack << [node.right, curr_sum] if node.right
    end
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([[1], [7, 9], [nil, nil, 2, 9]])
    solution = Solution.new.solution(root)
    expected = 408

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[1], [0, 1], [nil, 1, 6, 5]])
    solution = Solution.new.solution(root)
    expected = 332

    assert_equal(expected, solution)
  end

  def test_case3
    root = nil
    solution = Solution.new.solution(root)
    expected = 0

    assert_equal(expected, solution)
  end
end
