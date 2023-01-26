# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given a list of appointments,
  find all the conflicting appointments.
STATEMENT

# Solution
class Solution
  def solution(appointments)
    appointments.sort_by! { |appointment| appointment[0] }
    curr_interval = appointments[0]
    curr_end = appointments[0][1]
    result = {}

    (1...appointments.length).each do |i|
      if appointments[i][0] < curr_end
        result[curr_interval] = true
        result[appointments[i]] = true
        curr_end = [curr_end, appointments[i][1]].max
      else
        curr_end = appointments[i][1]
      end

      curr_interval = appointments[i]
    end

    result.keys
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([[4, 5], [2, 3], [3, 6], [5, 7], [7, 8]])
    expected = [[3, 6], [4, 5], [5, 7]]

    assert_equal(expected, solution)
  end
end
