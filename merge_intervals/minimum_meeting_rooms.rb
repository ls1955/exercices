# frozen_string_literal: false

require 'minitest/autorun'
require 'algorithms'

puts <<~STATEMENT
  Given a list of intervals representing
  the start and end time of ‘N’ meetings,
  find the minimum number of rooms
  required to hold all the meetings.
STATEMENT

# Solution
class Solution
  include Containers

  def solution(meetings)
    meetings.sort_by! { |meeting| meeting[0] }
    min_heap = Heap.new { |a, b| (a[1] <=> b[1]) == -1 }
    max_room = 0

    meetings.each do |meeting|
      min_heap.pop while !min_heap.empty? && min_heap.next[1] <= meeting[0]
      min_heap << meeting
      max_room = [max_room, min_heap.length].max
    end

    max_room
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([[1, 4], [2, 5], [7, 9]])
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([[6, 7], [2, 4], [8, 12]])
    expected = 1

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([[1, 4], [2, 3], [3, 6]])
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case4
    solution = Solution.new.solution([[4, 5], [2, 3], [2, 4], [3, 5]])
    expected = 2

    assert_equal(expected, solution)
  end
end
