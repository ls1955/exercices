# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given an array of intervals, find the next
  interval of each interval. In a list of
  intervals, for an interval ‘i’ its next
  interval ‘j’ will have the smallest ‘start’
  greater than or equal to the ‘end’ of ‘i’.

  Write a function to return an array containing
  indices of the next interval of each input
  interval. If there is no next interval of a
  given interval, return -1. It is given that
  none of the intervals have the same start point.
STATEMENT

# Solution
class Solution
  def solution(intervals)
    ends = intervals.map.with_index do |(start, owari), i|
      [start, owari, i]
    end.sort { |a, b| a[1] == b[1] ? a[2]- b[2] : a[1] - b[1] }
    starts = ends.sort_by(&:first)
    result = []

    ends.each do |_, owari, i|
      starts.shift until starts.empty? || starts[0][0] >= owari

      result[i] = starts[0] ? starts[0][2] : -1
    end
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    intervals = [[2, 3], [3, 4], [5, 6]]
    solution = Solution.new.solution(intervals)
    expected = [1, 2, -1]

    assert_equal(expected, solution)
  end

  def test_case2
    intervals = [[3, 4], [1, 5], [4, 6]]
    solution = Solution.new.solution(intervals)
    expected = [2, -1, -1]

    assert_equal(expected, solution)
  end

  def test_case3
    intervals = []
    solution = Solution.new.solution(intervals)
    expected = []

    assert_equal(expected, solution)
  end

  def test_case4
    intervals = [[1, 1]]
    solution = Solution.new.solution(intervals)
    expected = [0]

    assert_equal(expected, solution)
  end
end
