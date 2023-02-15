# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree, populate an array
  to represent its zigzag level order traversal.
  You should populate the values of all nodes
  of the first level from left to right, then
  right to left for the next level and keep
  alternating in the same manner for the following
  levels.
STATEMENT

# Solution
class Solution
  def solution(root)
    result = []

    return result unless root

    root.each_level_arr_with_index do |level, index|
      result << (left_to_right?(index) ? level.map(&:val) : level.reverse_each.map(&:val))
    end
    result
  end

  def left_to_right?(index)
    index.even?
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([1, 2, 3, 4, 5, 6, 7])
    solution = Solution.new.solution(root)
    expected = [[1], [3, 2], [4, 5, 6, 7]]

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[12], [7, 1], [nil, 9, 10, 5], [nil, nil, nil, nil, 20, 17]])
    solution = Solution.new.solution(root)
    expected = [[12], [1, 7], [9, 10, 5], [17, 20]]

    assert_equal(expected, solution)
  end
end
