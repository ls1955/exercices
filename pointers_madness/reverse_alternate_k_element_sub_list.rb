# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'

puts <<~STATEMENT
  Given the head of a LinkedList and a number k,
  reverse every alternating k sized sub-list
  starting from the head. If left with a sub-list
  less than k elements in the end, reverse it too.
STATEMENT

# Solution
class Solution
  def solution(head, k_counter)
    return head if k_counter == 1

    curr = head
    prev = nil

    while curr
      reversed_list_end = curr
      prev_list_end = prev

      k_counter.times do
        break unless curr

        curr.nxt, prev, curr = prev, curr, curr.nxt
      end

      prev_list_end ? prev_list_end.nxt = prev : head = prev
      reversed_list_end.nxt = curr
      prev = reversed_list_end

      k_counter.times do
        break unless curr

        curr = curr.nxt
        prev = prev.nxt
      end
    end

    head
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    head = LinkedList.with([1, 2, 3, 4, 5, 6, 7, 8])
    solution = Solution.new.solution(head, 2)
    expected = [2, 1, 3, 4, 6, 5, 7, 8]

    assert_equal(expected, solution.vals)
  end

  def test_case2
    head = LinkedList.with([1, 2, 3, 4, 5, 6, 7, 8])
    solution = Solution.new.solution(head, 3)
    expected = [3, 2, 1, 4, 5, 6, 8, 7]

    assert_equal(expected, solution.vals)
  end

  def test_case3
    head = LinkedList.with([1, 2, 3, 4, 5, 6, 7, 8])
    solution = Solution.new.solution(head, 1)
    expected = [1, 2, 3, 4, 5, 6, 7, 8]

    assert_equal(expected, solution.vals)
  end

  def test_case4
    head = LinkedList.with([1, 2, 3, 4, 5, 6, 7, 8])
    solution = Solution.new.solution(head, 999_999)
    expected = [8, 7, 6, 5, 4, 3, 2, 1]

    assert_equal(expected, solution.vals)
  end
end
