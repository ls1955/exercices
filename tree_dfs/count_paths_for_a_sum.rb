# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree and a number target sum,
  find amount of paths in the tree such that the sum
  of all the node values of each path equals
  target sum. Please note that the paths can
  start or end at any node but all paths must
  follow direction from parent to child (top to bottom).
STATEMENT

# Solution
class Solution
  def solution(root, target_sum)
    return 0 unless root

    hash = Hash.new(0)
    result = 0

    dfs = lambda do |node, curr_sum|
      return unless node

      curr_sum += node.val
      complement = curr_sum - target_sum

      result += 1 if curr_sum == target_sum
      result += hash[complement] if hash[complement]

      hash[curr_sum] += 1
      dfs.call(node.left, curr_sum)
      dfs.call(node.right, curr_sum)
      hash[curr_sum] -= 1
    end

    dfs.call(root, 0)
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([[1], [7, 9], [6, 5, 2, 3]])
    solution = Solution.new.solution(root, 12)
    expected = 3

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[12], [7, 1], [nil, 4, 10, 5]])
    solution = Solution.new.solution(root, 11)
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case3
    root = nil
    solution = Solution.new.solution(root, 3)
    expected = 0

    assert_equal(expected, solution)
  end
end
