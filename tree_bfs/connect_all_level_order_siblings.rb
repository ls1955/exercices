# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

puts <<~STATEMENT
  Given a binary tree, connect each node with
  its level order successor. The last node of
  each level should point to the first node of
  the next level.
STATEMENT

class TreeNode
  attr_accessor :nxt
end

# Solution
class Solution
  def solution(root)
    return nil unless root

    prev_node = nil

    root.bfs_each do |node|
      prev_node.nxt = node if prev_node
      prev_node = node
    end
    root
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    root = BinaryTree.with([1, 2, 3, 4, 5, 6, 7])
    solution = Solution.new.solution(root)
    node1 = root.fetch(1)
    node2 = root.fetch(2)
    node3 = root.fetch(3)
    node4 = root.fetch(4)
    node5 = root.fetch(5)
    node6 = root.fetch(6)
    node7 = root.fetch(7)

    assert_equal(node2, node1.nxt)
    assert_equal(node3, node2.nxt)
    assert_equal(node4, node3.nxt)
    assert_equal(node5, node4.nxt)
    assert_equal(node6, node5.nxt)
    assert_equal(node7, node6.nxt)
    assert_nil(node7.nxt)
  end

  def test_case2
    root = BinaryTree.with([[12], [7, 1], [nil, 9, 10, 5]])
    solution = Solution.new.solution(root)
    node12 = root.fetch(12)
    node7 = root.fetch(7)
    node1 = root.fetch(1)
    node9 = root.fetch(9)
    node10 = root.fetch(10)
    node5 = root.fetch(5)

    assert_equal(node7, node12.nxt)
    assert_equal(node1, node7.nxt)
    assert_equal(node9, node1.nxt)
    assert_equal(node10, node9.nxt)
    assert_equal(node5, node10.nxt)
    assert_nil(node5.nxt)
  end

  def test_case3
    root = nil
    solution = Solution.new.solution(root)

    assert_nil(solution)
  end
end
