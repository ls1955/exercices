# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given an array with positive numbers and
  a target number, find all of its contiguous
  subarrays whose product is less than the
  target number.
STATEMENT

# Solution
class Solution
  def solution(nums, target)
    subarrays = []

    nums.length.times do |left|
      right = left
      curr_product = 1

      while right < nums.length && curr_product < target
        curr_product *= nums[right]

        subarrays << nums[left..right] if curr_product < target

        right += 1
      end
    end

    subarrays.sort
  end

  # FIXME: temporary array is not working as intended
  def solution2(nums, target)
    subarrays = []
    left = 0
    product = 1

    nums.length.times do |right|
      product *= nums[right]

      while left < nums.length && product >= target
        product /= nums[left]
        left += 1
      end

      # FIXME
      temp_subarrays = []
      right.downto(left) do |i|
        temp_subarrays.unshift(nums[i])
        subarrays << temp_subarrays
      end
    end

    subarrays.sort
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution2([2, 5, 3, 10], 30)
    expected = [[2], [5], [2, 5], [3], [5, 3], [10]].sort

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution2([8, 2, 6, 5], 50)
    expected = [[8], [2], [8, 2], [6], [2, 6], [5], [6, 5]].sort

    assert_equal(expected, solution)
  end
end
