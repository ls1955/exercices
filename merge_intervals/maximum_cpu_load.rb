# frozen_string_literal: false

require 'minitest/autorun'
require 'algorithms'

puts <<~STATEMENT
  We are given a list of Jobs. Each job
  has a Start time, an End time, and a
  CPU load when it is running. Our goal
  is to find the maximum CPU load at any
  time if all the jobs are running on the
  same machine.
STATEMENT

# Solution
class Solution
  include Containers

  def solution(jobs)
    jobs.sort_by! { |job| job[0] }
    min_heap = Heap.new { |a, b| (a[1] <=> b[1]) == -1 }
    max_load = 0
    curr_load = 0

    jobs.each do |job|
      curr_load -= min_heap.pop[2] while !min_heap.empty? && min_heap.next[1] <= job[0]
      min_heap << job
      curr_load += job[2]
      max_load = [max_load, curr_load].max
    end

    max_load
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([[1, 4, 3], [2, 5, 4], [7, 9, 6]])
    expected = 7

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([[6, 7, 10], [2, 4, 11], [8, 12, 15]])
    expected = 15

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([[1, 4, 2], [2, 4, 1], [3, 6, 5]])
    expected = 8

    assert_equal(expected, solution)
  end
end
