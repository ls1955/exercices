# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given two lists of intervals, find the
  intersection of these two lists. Each
  list consists of disjoint intervals
  sorted on their start time.
STATEMENT

# Solution
class Solution
  def solution(first_list, second_list)
    i = 0
    j = 0
    result = []

    while i < first_list.length && j < second_list.length
      intersection_start = [first_list[i][0], second_list[j][0]].max
      intersection_end = [first_list[i][1], second_list[j][1]].min

      result << [intersection_start, intersection_end] if intersection_start <= intersection_end

      first_list[i][1] <= second_list[j][1] ? i += 1 : j += 1
    end

    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([[1, 3], [5, 6], [7, 9]], [[2, 3], [5, 7]])
    expected = [[2, 3], [5, 6], [7, 7]]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([[1, 3], [5, 7], [9, 12]], [[5, 10]])
    expected = [[5, 7], [9, 10]]

    assert_equal(expected, solution)
  end
end
