# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given a list of non-overlapping intervals
  sorted by their start time, insert a given
  interval at the correct position and merge
  all necessary intervals to produce a list
  that has only mutually exclusive intervals.
STATEMENT

# Solution
class Solution
  def solution(intervals, new_interval)
    result = []

    intervals.each do |interval|
      if !new_interval || interval[1] < new_interval[0]
        result << interval
      elsif interval[0] > new_interval[1]
        result << new_interval
        new_interval = nil
        result << interval
      else
        new_interval[0] = [new_interval[0], interval[0]].min
        new_interval[1] = [new_interval[1], interval[1]].max
      end
    end

    result << new_interval if new_interval
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([[1, 3], [5, 7], [8, 12]], [4, 6])
    expected = [[1, 3], [4, 7], [8, 12]]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([[1, 3], [5, 7], [8, 12]], [4, 10])
    expected = [[1, 3], [4, 12]]

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([[2, 3], [5, 7]], [1, 4])
    expected = [[1, 4], [5, 7]]

    assert_equal(expected, solution)
  end
end
