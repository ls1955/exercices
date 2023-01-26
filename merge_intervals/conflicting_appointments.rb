# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given an array of intervals representing
  ‘N’ appointments, find out if a person
  can attend all the appointments.
STATEMENT

# Solution
class Solution
  def solution(appointments)
    appointments.sort_by! { |appointment| appointment[0] }

    (1...appointments.length).each do |i|
      return false if appointments[i - 1][1] > appointments[i][0]
    end

    true
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([[1, 4], [2, 5], [7, 9]])
    expected = false

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([[6, 7], [2, 4], [8, 12]])
    expected = true

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([[4, 5], [2, 3], [3, 6]])
    expected = false

    assert_equal(expected, solution)
  end
end
