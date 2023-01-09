# frozen_string_literal: false

require 'minitest/autorun'
require_relative './listnode'

puts <<~STATEMENT
  Given the head of a Singly LinkedList,
  write a method to check if the LinkedList
  is a palindrome or not.

  Your algorithm should use constant space
  and the input LinkedList should be in the
  original form once the algorithm is finished.
  The algorithm should have O(N) time complexity.
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

    slow = reverse_list(slow)
    slow_copy = slow
    fast = head
    is_palin = true

    while slow && fast
      is_palin = false unless slow.val == fast.val

      slow = slow.nxt
      fast = fast.nxt
    end

    reverse_list(slow_copy)

    is_palin
  end

  def reverse_list(node)
    prev = nil
    node.nxt, prev, node = prev, node, node.nxt while node
    prev
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    vals = [4, 6, 4, 2]
    head = ListNode.new(2)
    dummy = head
    vals.each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end
    solution = Solution.new.solution(head)
    expected = true

    assert_equal(expected, solution)
  end

  def test_case2
    vals = [4, 6, 4, 2, 2]
    head = ListNode.new(2)
    dummy = head
    vals.each do |val|
      dummy.nxt = ListNode.new(val)
      dummy = dummy.nxt
    end
    solution = Solution.new.solution(head)
    expected = false

    assert_equal(expected, solution)
  end
end
