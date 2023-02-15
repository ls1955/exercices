# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree, find its maximum
  depth (or height).
STATEMENT

# Solution
class Solution
  def solution(root)
    return 0 unless root

    root.height
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([[1], [2, 3], [4, 5]])
    solution = Solution.new.solution(root)
    expected = 3

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[12], [7, 1], [nil, nil, 10, 5]])
    solution = Solution.new.solution(root)
    expected = 3

    assert_equal(expected, solution)
  end

  def test_case3
    root = BinaryTree.with([[12], [7, 1], [nil, 9, 10, 5], [nil, nil, nil, nil, 11]])
    solution = Solution.new.solution(root)
    expected = 4

    assert_equal(expected, solution)
  end

  def test_case4
    root = nil
    solution = Solution.new.solution(root)
    expected = 0

    assert_equal(expected, solution)
  end
end
