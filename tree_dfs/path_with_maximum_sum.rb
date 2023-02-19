# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Find the path with the maximum sum in a
  given binary tree. Write a function that
  returns the maximum sum. A path can be
  defined as a sequence of nodes between
  any two nodes and doesn’t necessarily
  pass through the root.
STATEMENT

# Solution
class Solution
  def initialize
    @result = -Float::INFINITY
  end

  def solution(root)
    dfs(root)
    @result
  end

  def dfs(node)
    return 0 unless node

    left_max_sum = [dfs(node.left), 0].max
    right_max_sum = [dfs(node.right), 0].max
    curr_max_sum = node.val + left_max_sum + right_max_sum

    @result = [@result, curr_max_sum].max
    node.val + [left_max_sum, right_max_sum].max
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([[1], [2, 3], [nil, 4, 5, 6]])
    solution = Solution.new.solution(root)
    expected = 16

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[1], [2, 3], [1, 3, 5, 6], [nil, nil, nil, nil, 7, 8, 9]])
    solution = Solution.new.solution(root)
    expected = 31

    assert_equal(expected, solution)
  end

  def test_case3
    root = BinaryTree.with([-1_000, -999_999])
    solution = Solution.new.solution(root)
    expected = -1_000
    
    assert_equal(expected, solution)
  end

  def test_case4
    root = BinaryTree.with([-999_999])
    solution = Solution.new.solution(root)
    expected = -999_999

    assert_equal(expected, solution)
  end
end
