# frozen_string_literal: true

require 'minitest/autorun'

puts <<~STATEMENT
  Given a set of intervals, find out
  if any two intervals overlap.
STATEMENT

# Solution
class Solution
  def solution(intervals)
    intervals.sort_by! { |interval| interval[0] }

    (1...intervals.length).each do |i|
      return true if intervals[i - 1][1] >= intervals[i][0]
    end

    false
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([[1, 4], [2, 5], [7, 9]])
    expected = true

    assert_equal(expected, solution)
  end
end
