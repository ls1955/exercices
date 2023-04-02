# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given an array of numbers which is sorted in
  ascending order and also rotated by some
  arbitrary number, find if a given ‘key’ is
  present in it.

  Write a function to return the index of the
  ‘key’ in the rotated array. If the ‘key’
  is not present, return -1. You can assume
  that the given array does not have any duplicates.
STATEMENT

# Solution
class Solution
  def solution(nums, key)
    left = 0
    right = nums.length - 1

    while left <= right
      mid = (left + right) / 2

      return mid if nums[mid] == key

      if nums[left] <= nums[mid]
        key.between?(nums[left], nums[mid]) ? right = mid - 1 : left = mid + 1
      else
        key.between?(nums[mid], nums[right]) ? left = mid + 1 : right = mid - 1
      end
    end
    -1
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [10, 15, 1, 3, 8]
    key = 15
    solution = Solution.new.solution(nums, key)
    expected = 1

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [4, 5, 7, 9, 10, -1, 2]
    key = 10
    solution = Solution.new.solution(nums, key)
    expected = 4

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [4, 5, 7, 9, 10, -1, 2]
    key = 100
    solution = Solution.new.solution(nums, key)
    expected = -1

    assert_equal(expected, solution)
  end

  def test_case4
    nums = [4, 5, 7, 9, 10, -1, 2]
    key = -1
    solution = Solution.new.solution(nums, key)
    expected = 5

    assert_equal(expected, solution)
  end
end
