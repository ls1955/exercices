# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree, return an array
  containing nodes' val in its right view.
  The right view of a binary tree is 
  the set of nodes visible when the 
  tree is seen from the right side.
STATEMENT

# Solution
class Solution
  def solution(root)
    result = []

    return result unless root

    root.each_level_arr { |level| result << level.last.val }
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([[1], [2, 3], [4, 5, 6, 7]])
    solution = Solution.new.solution(root)
    expected = [1, 3, 7]

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[12], [7, 1], [nil, 9, 10, 5], [nil, nil, 3]])
    solution = Solution.new.solution(root)
    expected = [12, 1, 5, 3]

    assert_equal(expected, solution)
  end

  def test_case3
    root = nil
    solution = Solution.new.solution(root)
    expected = []

    assert_equal(expected, solution)
  end
end
