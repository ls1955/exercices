# frozen_string_literal: false

require 'minitest/autorun'
require_relative '../lib/linked_list'
require_relative '../lib/listnode'

puts <<~STATEMENT
  Given the head of a Singly LinkedList,
  write a method to return the middle
  node of the LinkedList. If the total
  number of nodes in the LinkedList is
  even, return the second middle node.
STATEMENT

# Solution
class Solution
  def solution(head)
    slow = head
    fast = head

    while fast&.nxt
      slow = slow.nxt
      fast = fast.nxt.nxt
    end
    slow
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    head = LinkedList.with([1, 2, 3, 4, 5])
    solution = Solution.new.solution(head)
    expected = 3

    assert_equal(expected, solution.val)
  end

  def test_case2
    head = LinkedList.with([1, 2, 3, 4, 5, 6])
    solution = Solution.new.solution(head)
    expected = 4

    assert_equal(expected, solution.val)
  end

  def test_case3
    head = LinkedList.with([1, 2, 3, 4, 5, 6, 7])
    solution = Solution.new.solution(head)
    expected = 4

    assert_equal(expected, solution.val)
  end
end
