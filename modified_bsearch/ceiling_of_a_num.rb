# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given an array of numbers sorted in an ascending
  order, find the ceiling of a given number ‘key’.
  The ceiling of the ‘key’ will be the smallest
  element in the given array greater than or equal
  to the ‘key’.

  Write a function to return the index of the ceiling
  of the ‘key’. If there isn’t any ceiling return -1.
STATEMENT

# Solution
class Solution
  def solution(nums, key)
    nums.bsearch_index { |num| num >= key } || -1
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [4, 6, 10]
    solution = Solution.new.solution(nums, 6)
    expected = 1

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [1, 3, 8, 10, 15]
    solution = Solution.new.solution(nums, 12)
    expected = 4

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [4, 6, 10]
    solution = Solution.new.solution(nums, 17)
    expected = -1

    assert_equal(expected, solution)
  end

  def test_case4
    nums = [4, 6, 10]
    solution = Solution.new.solution(nums, -1)
    expected = 0

    assert_equal(expected, solution)
  end

  def test_case5
    nums = [1]
    solution = Solution.new.solution(nums, 1)
    expected = 0

    assert_equal(expected, solution)
  end

  def test_case6
    nums = [1]
    solution = Solution.new.solution(nums, 99)
    expected = -1

    assert_equal(expected, solution)
  end
end
