# frozen_string_literal: false

require 'minitest/autorun'
require_relative '../lib/linked_list'
require_relative '../lib/listnode'

puts <<~STATEMENT
  Given the head of a Singly LinkedList,
  write a function to determine if the
  LinkedList has a cycle in it or not.
STATEMENT

# Solution
class Solution
  def solution(head)
    slow = head
    fast = head

    while fast&.nxt
      slow = slow.nxt
      fast = fast.nxt.nxt

      return true if slow == fast
    end

    false
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    head = LinkedList.with([1, 2, 3, 4, 5, 6])
    solution = Solution.new.solution(head)
    expected = false

    assert_equal(expected, solution)
  end

  def test_case2
    head = LinkedList.with([1, 2, 3, 4, 5, 6])
    head.nxt.nxt.nxt.nxt.nxt.nxt = head.nxt.nxt
    solution = Solution.new.solution(head)
    expected = true

    assert_equal(expected, solution)
  end

  def test_case3
    head = ListNode.new(1)
    dummy = head
    (2..6).each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end
    head.nxt.nxt.nxt.nxt.nxt.nxt = head.nxt.nxt.nxt
    solution = Solution.new.solution(head)
    expected = true

    assert_equal(expected, solution)
  end
end
