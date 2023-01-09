# frozen_string_literal: false

require 'minitest/autorun'
require_relative './../lib/linked_list'

puts <<~STATEMENT
  Given the head of a Singly LinkedList,
  write a method to modify the LinkedList
  such that the nodes from the second half
  of the LinkedList are inserted alternately
  to the nodes from the first half in reverse order.
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

    curr = slow.nxt
    prev = nil

    while curr
      curr.nxt, prev, curr = prev, curr, curr.nxt
    end

    curr = head

    while prev
      curr_nxt_temp = curr.nxt
      prev_nxt_temp = prev.nxt
      curr.nxt = prev
      prev.nxt = curr_nxt_temp
      curr = prev.nxt.nxt
      prev = prev_nxt_temp
    end

    curr.nxt = nil
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    head = LinkedList.for(head_val: 2, vals: [4, 6, 8, 10, 12])
    solution = Solution.new.solution(head)
    expected = LinkedList.for(head_val: 2, vals: [12, 4, 10, 6, 8])

    assert_equal(expected.to_s, solution.to_s)
  end

  def test_case2
    head = LinkedList.for(head_val: 2, vals: [4, 6, 8, 10])
    solution = Solution.new.solution(head)
    expected = LinkedList.for(head_val: 2, vals: [10, 4, 8, 6])

    assert_equal(expected.to_s, solution.to_s)
  end
end
