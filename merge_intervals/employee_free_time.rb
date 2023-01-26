# frozen_string_literal: false

require 'minitest/autorun'
require 'algorithms'

puts <<~STATEMENT
  For ‘K’ employees, we are given a list
  of intervals representing the working
  hours of each employee. Our goal is to
  find out if there is a free interval that
  is common to all employees. You can assume
  that each list of employee working hours is
  sorted on the start time.
STATEMENT

class EmployeeInterval
  attr_accessor :interval, :employee_index, :intervals_index

  def initialize(interval, employee_index, intervals_index)
    @interval = interval
    @employee_index = employee_index
    @intervals_index = intervals_index
  end
end

# Solution
class Solution
  include Containers

  def solution(employee_intervals)
    min_heap = Heap.new { |a, b| (a.interval[0] <=> b.interval[0]) == -1 }
    result = []

    employee_intervals.each_with_index do |intervals, i|
      min_heap << EmployeeInterval.new(intervals[0], i, 0)
    end
    curr_end = min_heap.pop.interval[1]

    until min_heap.empty?
      curr_interval = min_heap.pop

      if curr_interval.interval[0] > curr_end
        result << [curr_end, curr_interval.interval[0]]
        curr_end = curr_interval.interval[1]
      else
        curr_end = [curr_end, curr_interval.interval[1]].max
      end

      curr_i = curr_interval.employee_index
      curr_j = curr_interval.intervals_index
      if curr_j + 1 < employee_intervals[curr_i].length
        min_heap << EmployeeInterval.new(employee_intervals[curr_i][curr_j + 1], curr_i, curr_j + 1)
      end
    end

    result
  end

  def nlogn_solution(intervals)
    intervals.flatten!(1).sort_by! { |interval| interval[0] }
    curr_end = intervals[0][1]
    result = []

    (1...intervals.length).each do |i|
      if intervals[i][0] > curr_end
        result << [curr_end, intervals[i][0]]
        curr_end = intervals[i][1]
      else
        curr_end = [curr_end, intervals[i][1]].max
      end
    end

    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([[[1, 3], [5, 6]], [[2, 3], [6, 8]]])
    expected = [[3, 5]]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([[[1, 3], [9, 12]], [[2, 4]], [[6, 8]]])
    expected = [[4, 6], [8, 9]]

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([[[1, 3]], [[2, 4]], [[3, 5], [7, 9]]])
    expected = [[5, 7]]

    assert_equal(expected, solution)
  end
end
