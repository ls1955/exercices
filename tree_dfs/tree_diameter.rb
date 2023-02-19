# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree, find the length of its
  diameter. The diameter of a tree is the number
  of nodes on the longest path between any two
  leaf nodes. The diameter of a tree may or may
  not pass through the root.

  Note: You can always assume that there are at
  least two leaf nodes in the given tree.
STATEMENT

# Solution
class Solution
  def initialize
    @result = 0
  end

  def solution(root)
    dfs(root)
    @result
  end

  def dfs(node)
    return 0 unless node

    left_max_len = dfs(node.left)
    right_max_len = dfs(node.right)
    curr_max_len = 1 + left_max_len + right_max_len
    @result = [result, curr_max_len].max

    1 + [left_max_len, right_max_len].max
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([[1], [2, 3], [nil, 4, 5, 6]])
    solution = Solution.new.solution(root)
    expected = 5

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[1], [2, 3], [nil, nil, 5, 6], [nil, nil, nil, nil, 7, 8, 9, nil], [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 10, nil, 11]])
    solution = Solution.new.solution(root)
    expected = 7

    assert_equal(expected, solution)
  end
end
