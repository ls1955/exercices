# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree, populate an array
  to represent the averages of all of its levels.
STATEMENT

# Solution
class Solution
  def solution(root)
    result = []

    return result unless root

    root.each_level_arr do |level|
      result << level.sum(&:val).fdiv(level.length)
    end
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([1, 2, 3, 4, 5, 6, 7])
    solution = Solution.new.solution(root)
    expected = [1, 2.5, 5.5]

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([12, 7, 1, 9, 2, 10, 5])
    solution = Solution.new.solution(root)
    expected = [12.0, 4.0, 6.5]

    assert_equal(expected, solution)
  end
end
