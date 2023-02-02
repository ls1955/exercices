# frozen_string_literal: true

# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'

puts <<~STATEMENT
  Given the head of a Singly LinkedList,
  reverse the LinkedList and return the
  new head of the reversed LinkedList.
STATEMENT

# Solution
class Solution
  def solution(head)
    head.reverse
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    head = LinkedList.with([2, 4, 6, 8, 10])
    solution = Solution.new.solution(head)
    expected = [10, 8, 6, 4, 2]

    assert_equal(expected, solution.vals)
  end
end
