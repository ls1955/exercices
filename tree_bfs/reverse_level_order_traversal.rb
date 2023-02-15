# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree, populate an array to
  represent its level-by-level traversal in
  reverse order, i.e., the lowest level comes
  first. You should populate the values of all
  nodes in each level from left to right in
  separate sub-arrays.
STATEMENT

# Solution
class Solution
  def solution(root)
    result = []

    return result unless root

    root.each_level_arr { |level| result.unshift(level.map(&:val)) }
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([1, 2, 3, 4, 5, 6, 7])
    solution = Solution.new.solution(root)
    expected = [[4, 5, 6, 7], [2, 3], [1]]

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[12], [7, 1], [nil, 9, 10, 5]])
    solution = Solution.new.solution(root)
    expected = [[9, 10, 5], [7, 1], [12]]

    assert_equal(expected, solution)
  end
end
