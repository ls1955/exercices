# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Find the minimum depth of a binary tree.
  The minimum depth is the number of nodes
  along the shortest path from the root node
  to the nearest leaf node.
STATEMENT

# Solution
class Solution
  def solution(root)
    depth = 0

    return depth unless root

    root.each_level_arr do |level|
      depth += 1

      break if level.any?(&:leaf?)
    end
    depth
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([[1], [2, 3], [4, 5]])
    solution = Solution.new.solution(root)
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[12], [7, 1], [nil, nil, 10, 5]])
    solution = Solution.new.solution(root)
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case3
    root = BinaryTree.with([[12], [7, 1], [nil, 9, 10, 5], [nil, nil, nil, nil, 11]])
    solution = Solution.new.solution(root)
    expected = 3

    assert_equal(expected, solution)
  end

  def test_case4
    root = nil
    solution = Solution.new.solution(root)
    expected = 0

    assert_equal(expected, solution)
  end
end
