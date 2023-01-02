# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
Problem Statement #
  Given an array of sorted numbers and a target sum,
  find a pair in the array whose sum is equal to the given target.
STATEMENT

# Solution
class Solution
  def solution(nums, target)
    left = 0
    right = nums.length - 1

    while left < right
      curr_sum = nums[left] + nums[right]

      if curr_sum < target
        left += 1
      elsif curr_sum > target
        right -= 1
      else
        return [left, right]
      end
    end
  end

  # other approach
  def bsearch_approach(nums, target)
    nums.each_with_index do |num, left|
      complement = target - num

      complement_index = (left...(nums.length)).bsearch { |i| complement <=> nums[i] }

      return [left, complement_index] if complement_index
    end
  end

  def hashtable_approach(nums, target)
    hash = {}

    nums.each_with_index do |num, i|
      complement = target - num

      return [hash[complement], i] if hash[complement]

      hash[num] = i
    end
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([1, 2, 3, 4, 6], 6)
    expected = [1, 3]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([2, 5, 9, 11], 11)
    expected = [0, 2]

    assert_equal(expected, solution)
  end
end
