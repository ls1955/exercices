# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'

puts <<~STATEMENT
  Given the head of a LinkedList and a number k,
  reverse every k sized sub-list starting from head.
  If, in the end, you are left with a sub-list with
  less than k elements, reverse it too.
STATEMENT

# Solution
class Solution
  def solution(head, k_counter)
    curr = head
    prev = nil

    while curr
      puts head
      reversed_list_end = curr
      left_list_end = prev

      k_counter.times do
        break unless curr

        curr.nxt, prev, curr = prev, curr, curr.nxt
      end

      left_list_end ? left_list_end.nxt = prev : head = prev
      reversed_list_end.nxt = curr
      prev = reversed_list_end
    end

    head
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    head = LinkedList.with([1, 2, 3, 4, 5, 6, 7, 8])
    solution = Solution.new.solution(head, 3)
    expected = [3, 2, 1, 6, 5, 4, 8, 7]

    assert_equal(expected, solution.vals)
  end
end
