# frozen_string_literal: true

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
  def solution(list)
    slow = list.head
    fast = list.head

    while fast&.nxt
      slow = slow.nxt
      fast = fast.nxt.nxt
    end

    curr = slow.nxt
    prev = nil
    slow.nxt = nil
    curr.nxt, prev, curr = prev, curr, curr.nxt while curr
    curr = list.head

    while prev
      curr_nxt_temp = curr.nxt
      prev_nxt_temp = prev.nxt
      curr.nxt = prev
      prev.nxt = curr_nxt_temp
      curr = curr_nxt_temp
      prev = prev_nxt_temp
    end

    list
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    head = LinkedList.for(head_val: 2, follow_vals: [4, 6, 8, 10, 12])
    solution = Solution.new.solution(head)
    expected = LinkedList.for(head_val: 2, follow_vals: [12, 4, 10, 6, 8])

    assert_equal(expected.to_s, solution.to_s)
  end

  def test_case2
    head = LinkedList.for(head_val: 2, follow_vals: [4, 6, 8, 10])
    solution = Solution.new.solution(head)
    expected = LinkedList.for(head_val: 2, follow_vals: [10, 4, 8, 6])

    assert_equal(expected.to_s, solution.to_s)
  end

  def test_case3
    head = LinkedList.for(head_val: 1, follow_vals: [2, 3, 4, 5, 6])
    solution = Solution.new.solution(head)
    expected = LinkedList.for(head_val: 1, follow_vals: [6, 2, 5, 3, 4])

    assert_equal(expected.to_s, solution.to_s)
  end
end
