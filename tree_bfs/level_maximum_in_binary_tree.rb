# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Find the largest value on each level
  of a binary tree.
STATEMENT

# Solution
class Solution
  def solution(root)
    return [] unless root

    root.level_order_traversal.map(&:max)
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([1, 2, 3, 4, 5, 6, 7])
    solution = Solution.new.solution(root)
    expected = [1, 3, 7]

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([12, 7, 1, 9, 2, 10, 5])
    solution = Solution.new.solution(root)
    expected = [12, 7, 10]

    assert_equal(expected, solution)
  end
end
