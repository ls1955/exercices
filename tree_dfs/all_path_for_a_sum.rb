# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree and a number target sum,
  find all path's val from root-to-leaf such
  that the sum of all the node values of each
  path equals target sum.
STATEMENT

# Solution
class Solution
  def solution(root, target_sum)
    return [] unless root

    result = []
    stack = [[root, target_sum, []]]

    until stack.empty?
      node, curr_sum, path_vals = stack.pop
      path_vals << node.val

      result << path_vals if node.leaf? && node.val == curr_sum

      stack << [node.left, curr_sum - node.val, path_vals.dup] if node.left
      stack << [node.right, curr_sum - node.val, path_vals.dup] if node.right
    end
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([[1], [7, 9], [4, 5, 2, 7]])
    solution = Solution.new.solution(root, 12)
    expected = [[1, 7, 4], [1, 9, 2]]

    assert_equal(expected.sort, solution.sort)
  end

  def test_case2
    root = BinaryTree.with([[12], [7, 1], [nil, 4, 10, 5]])
    solution = Solution.new.solution(root, 23)
    expected = [[12, 7, 4], [12, 1, 10]]

    assert_equal(expected.sort, solution.sort)
  end

  def test_case3
    root = BinaryTree.with([[1], [2, 3], [4, 5, 6, 7]])
    solution = Solution.new.solution(root, 999_999)
    expected = []

    assert_equal(expected, solution)
  end

  def test_case4
    root = nil
    solution = Solution.new.solution(root, 100)
    expected = []
  end
end
