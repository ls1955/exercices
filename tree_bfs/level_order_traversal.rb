# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree, populate an array
  to represent its level-by-level traversal.
  You should populate the values of all nodes
  of each level from left to right in separate
  sub-arrays.
STATEMENT

# Solution
class Solution
  def solution(root)
    return [] unless root

    root.level_order_traversal
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([1, 2, 3, 4, 5, 6, 7])
    solution = Solution.new.solution(root)
    expected = [[1], [2, 3], [4, 5, 6, 7]]

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[12], [7, 1], [nil, 9, 10, 5]])
    solution = Solution.new.solution(root)
    expected = [[12], [7, 1], [9, 10, 5]]

    assert_equal(expected, solution)
  end
end
