# frozen_string_literal: false

require 'minitest/autorun'
require_relative './listnode'

puts <<~STATEMENT
  Given the head of a Singly LinkedList that
  contains a cycle, write a function to find
  the starting node of the cycle.
STATEMENT

# Solution
class Solution
  def solution(head)
    slow = head
    fast = head
    cycle = false

    while fast&.nxt
      slow = slow.nxt
      fast = fast.nxt.nxt

      if slow == fast
        cycle = true
        break
      end
    end

    return nil unless cycle

    slow = head

    until slow == fast
      slow = slow.nxt
      fast = fast.nxt
    end

    slow
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    head = ListNode.new(1)
    dummy = head
    (2..6).each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end
    head.nxt.nxt.nxt.nxt.nxt.nxt = head.nxt.nxt
    solution = Solution.new.solution(head)
    expected = 3

    assert_equal(expected, solution.val)
  end

  def test_case2
    head = ListNode.new(1)
    dummy = head
    (2..6).each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end
    head.nxt.nxt.nxt.nxt.nxt.nxt = head.nxt.nxt.nxt
    solution = Solution.new.solution(head)
    expected = 4

    assert_equal(expected, solution.val)
  end

  def test_case3
    head = ListNode.new(1)
    dummy = head
    (2..6).each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end
    head.nxt.nxt.nxt.nxt.nxt.nxt = head
    solution = Solution.new.solution(head)
    expected = 1

    assert_equal(expected, solution.val)
  end
end
