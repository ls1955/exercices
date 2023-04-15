# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  In a non-empty array of integers, every number
  appears twice except for one, find that single number.
STATEMENT

# Solution
class Solution
  def solution(nums)
    nums.reduce(&:^)
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [1, 4, 2, 1, 3, 2, 3]
    solution = Solution.new.solution(nums)
    expected = 4

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [7, 9, 7]
    solution = Solution.new.solution(nums)
    expected = 9

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [1]
    solution = Solution.new.solution(nums)
    expected = 1

    assert_equal(expected, solution)
  end

  def test_case4
    nums = [2, 4, 4, 5, 6, 6, 5, 2, 3]
    solution = Solution.new.solution(nums)
    expected = 3

    assert_equal(expected, solution)
  end
end
