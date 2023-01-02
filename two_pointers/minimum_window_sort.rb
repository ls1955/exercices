# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given an array, find the length of
  the smallest subarray in it which
  when sorted will sort the whole array.
STATEMENT

# Solution
class Solution
  def solution(nums)
    left = 0
    right = nums.length - 1
    subarray_min = Float::INFINITY
    subarray_max = -Float::INFINITY

    left += 1 while left < (nums.length - 1) && nums[left] <= nums[left + 1]

    return 0 if left == nums.length - 1

    right -= 1 while right > left && nums[right - 1] <= nums[right]

    (left..right).each do |i|
      subarray_min = [subarray_min, nums[i]].min
      subarray_max = [subarray_max, nums[i]].max
    end

    left -= 1 while left > 0 && nums[left - 1] > subarray_min
    right += 1 while right < nums.length - 1 && nums[right + 1] < subarray_max

    right - left + 1
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([1, 2, 5, 3, 7, 10, 9, 12])
    expected = 5

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([1, 3, 2, 0, -1, 7, 10])
    expected = 5

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([1, 2, 3])
    expected = 0

    assert_equal(expected, solution)
  end

  def test_case4
    solution = Solution.new.solution([3, 2, 1])
    expected = 3

    assert_equal(expected, solution)
  end
end
