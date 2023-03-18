# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given a set of numbers that might contain
  duplicates, find all of its distinct subsets.
STATEMENT

# Solution
class Solution
  def solution(nums)
    result = [[]]
    start = 0
    prev_end = 0

    nums.sort!
    nums.each_with_index do |num, i|
      start = i > 0 && num == nums[i - 1] ? prev_end : 0
      prev_end = result.length

      (start...prev_end).each do |j|
        result << (result[j] + [num])
      end
    end
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([1, 3, 3])
    expected = [[], [1], [3], [1, 3], [3, 3], [1, 3, 3]]

    assert_equal(expected.map(&:sort).sort, solution.map(&:sort).sort)
  end

  def test_case2
    solution = Solution.new.solution([1, 5, 3, 3])
    expected = [[], [1], [5], [3], [1, 5], [1, 3], [5, 3], [1, 5, 3], [3, 3], [1, 3, 3], [3, 3,5 ], [1, 5, 3, 3]]

    assert_equal(expected.map(&:sort).sort, solution.map(&:sort).sort)
  end

  def test_case3
    solution = Solution.new.solution([])
    expected = [[]]

    assert_equal(expected, solution)
  end
end
