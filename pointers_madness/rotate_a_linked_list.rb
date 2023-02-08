# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'

puts <<~STATEMENT
  Given the head of a Singly LinkedList and a number k,
  rotate the LinkedList to the right by k nodes.
STATEMENT

# Solution
class Solution
  def solution(head, counter)
    # as linked list might form a circle later on,
    # need temp to avoid infinite loop
    len = length(head)

    return head if len <= 1

    curr = head
    curr = curr.nxt while curr.nxt
    counter %= len

    return head if counter.zero?

    curr.nxt = head
    (len - counter).times { curr = curr.nxt }
    new_head = curr.nxt
    curr.nxt = nil
    new_head
  end

  def length(head)
    return 0 unless head

    dummy = head
    result = 1
    while dummy.nxt
      dummy = dummy.nxt
      result += 1
    end
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    head = LinkedList.with([1, 2, 3, 4, 5, 6])
    solution = Solution.new.solution(head, 3)
    expected = [4, 5, 6, 1, 2, 3]

    assert_equal(expected, solution.vals)
  end

  def test_case2
    head = LinkedList.with([1, 2, 3, 4, 5])
    solution = Solution.new.solution(head, 8)
    expected = [3, 4, 5, 1, 2]

    assert_equal(expected, solution.vals)
  end
end
