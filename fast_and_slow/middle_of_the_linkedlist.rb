# frozen_string_literal: false

require 'minitest/autorun'
require_relative './listnode'

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
    head = ListNode.new(1)
    dummy = head
    (2..5).each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end

    solution = Solution.new.solution(head)
    expected = 3

    assert_equal(expected, solution.val)
  end

  def test_case2
    head = ListNode.new(1)
    dummy = head
    (2..5).each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end
    dummy.nxt = ListNode.new(6)
    solution = Solution.new.solution(head)
    expected = 4

    assert_equal(expected, solution.val)
  end

  def test_case3
    head = ListNode.new(1)
    dummy = head
    (2..5).each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end
    (6..7).each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end
    solution = Solution.new.solution(head)
    expected = 4

    assert_equal(expected, solution.val)
  end
end
