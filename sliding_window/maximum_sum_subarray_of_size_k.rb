# frozen_string_literal: false

require 'minitest/autorun'

puts <<~HEREDOC
  Problem Statement #
  Given an array of positive numbers and a positive number ‘k’,
  find the maximum sum of any contiguous subarray of size ‘k’.
HEREDOC

# Solution
class Solution
  def solution(nums, k)
    max_sum = 0
    curr_sum = 0
    left = 0

    nums.length.times do |right|
      curr_sum += nums[right]

      next unless right >= (k - 1)

      max_sum = [max_sum, curr_sum].max
      curr_sum -= nums[left]
      left += 1
    end

    max_sum
  end
end

# Test
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([2, 1, 5, 1, 3, 2], 3)

    assert_equal(9, solution)
  end

  def test_case2
    solution = Solution.new.solution([2, 3, 4, 1, 5], 2)

    assert_equal(7, solution)
  end
end
