# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given an array of n−1 integers in the range from 
  1 to n, find the one number that is missing from the array.
STATEMENT

# Solution
class Solution
  def solution(nums)
    (1..nums.length + 1).reduce(:^) ^ nums.reduce(:^)
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [1, 5, 2, 6, 4]
    solution = Solution.new.solution(nums)
    expected = 3

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [1, 3]
    solution = Solution.new.solution(nums)
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [1, 4, 5, 2, 3, 6]
    solution = Solution.new.solution(nums)
    expected = 7

    assert_equal(expected, solution)
  end
end
