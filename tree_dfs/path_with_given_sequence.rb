# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree and a number sequence,
  find if the sequence is present as a
  root-to-leaf path in the given tree.
STATEMENT

# Solution
class Solution
  def solution(root, seq)
    return seq.empty? unless root

    recur_dfs(root, seq, 0)
  end

  def iter_bfs(root, seq)
    return false unless root

    queue = [[root, 0]]

    queue.each do |node, index|
      next unless node.val == seq[index]

      return true if node.leaf? && index == seq.length - 1

      queue << [node.left, index + 1] if node.left
      queue << [node.right, index + 1] if node.right
    end
    false
  end

  def recur_dfs(root, seq)
    return false unless root

    stack = [[root, 0]]

    until stack.empty?
      node, index = stack.pop

      next unless node.val == seq[index]

      return true if node.leaf? && index == seq.length - 1

      stack << [node.left, index + 1] if node.left
      stack << [node.right, index + 1] if node.right
    end
    false
  end

  def recur_dfs(root, seq, index = 0)
    return false unless root && seq[index] == root.val

    return true if root.leaf? && index == seq.length - 1

    recur_dfs(root.left, seq, index + 1) || recur_dfs(root.right, seq, index + 1)
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([[1], [7, 9], [nil, nil, 2, 9]])
    seq = [1, 9, 9]
    solution = Solution.new.solution(root, seq)
    expected = true

    assert_equal(expected, solution)
  end

  def test_case2
    root = BinaryTree.with([[1], [0, 1], [nil, 1, 6, 5]])
    seq = [1, 0, 7]
    solution = Solution.new.solution(root, seq)
    expected = false

    assert_equal(expected, solution)
  end

  def test_case3
    root = BinaryTree.with([[1], [0, 1], [nil, 1, 6, 5]])
    seq = [1, 1, 6]
    solution = Solution.new.solution(root, seq)
    expected = true

    assert_equal(expected, solution)
  end

  def test_case4
    root = nil
    seq = [1, 3, 5]
    solution = Solution.new.solution(root, seq)
    expected = false

    assert_equal(expected, solution)
  end

  def test_case5
    root = BinaryTree.with([1, 2, 3, 4, 5])
    seq = []
    solution = Solution.new.solution(root, seq)
    expected = false

    assert_equal(expected, solution)
  end
end
