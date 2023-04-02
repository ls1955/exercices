# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given an array of numbers sorted in ascending order,
  find the floor of a given number ‘key’. The floor of
  the ‘key’ will be the biggest element in the given
  array smaller than or equal to the ‘key’

  Write a function to return the index of the floor of
  the ‘key’. If there isn’t a floor, return -1.
STATEMENT

# Solution
class Solution
  def solution(nums, key)
    left = 0
    right = nums.length - 1

    while left < right
      mid = ((left + right) / 2) + 1

      nums[mid] > key ? right = mid - 1 : left = mid
    end
    nums[left] <= key ? left : -1
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
    expected = 3

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [4, 6, 10]
    solution = Solution.new.solution(nums, 17)
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case4
    nums = [4, 6, 10]
    solution = Solution.new.solution(nums, -1)
    expected = -1

    assert_equal(expected, solution)
  end
end
