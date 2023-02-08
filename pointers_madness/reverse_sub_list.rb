# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'
require_relative '../lib/listnode'

puts <<~STATEMENT

Given the head of a LinkedList and two positions
left and right, reverse the LinkedList from position
left to right.
STATEMENT

# Solution
class Solution
  # Reverse one node at a time
  # Copied from Stephan
  def solution(head, left, right)
    return head if left == right

    pre_head = ListNode.new(-999_999, head)
    prev = pre_head

    (left - 1).times { prev = prev.nxt }

    pivot = prev.nxt

    (right - left).times do
      prev.nxt, pivot.nxt.nxt = pivot.nxt.nxt, prev.nxt
      prev.nxt, pivot.nxt = pivot.nxt, prev.nxt
    end

    pre_head.nxt
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    head = LinkedList.with([1, 2, 3, 4, 5])
    solution = Solution.new.solution(head, 2, 4)
    expected = [1, 4, 3, 2, 5]

    assert_equal(expected, solution.vals)
  end
end
