# frozen_string_literal: true

require 'minitest/autorun'

puts <<~STATEMENT
  Given a list of intervals, merge all the
  overlapping intervals to produce a list
  that has only mutually exclusive intervals.
STATEMENT

# Solution
class Solution
  def solution(intervals)
    intervals.sort_by! { |interval| interval[0] }
    results = [intervals[0]]

    (1...intervals.length).each do |i|
      if intervals[i][0] > results[-1][1]
        results << intervals[i]
      else
        results[-1][1] = [results[-1][1], intervals[i][1]].max
      end
    end

    results
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([[1, 4], [2, 5], [7, 9]])
    expected = [[1, 5], [7, 9]]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([[6,7], [2,4], [5,9]])
    expected = [[2,4], [5,9]]

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([[1,4], [2,6], [3,5]])
    expected = [[1,6]]

    assert_equal(expected, solution)
  end
end
