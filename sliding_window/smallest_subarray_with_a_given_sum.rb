# frozen_string_literal: false

require 'minitest/autorun'

puts <<~HEREDOC
Problem Statement #
  Given an array of positive numbers and a positive number ‘S’,
  find the length of the smallest contiguous subarray whose sum is greater than or equal to ‘S’.
  Return 0, if no such subarray exists.
HEREDOC

# Solution
class Solution
  def solution(nums, s)
    min_length = Float::INFINITY
    left = 0
    curr_sum = 0

    nums.length.times do |right|
      curr_sum += nums[right]

      while curr_sum >= s && left <= right
        curr_window_size = right - left + 1

        curr_sum -= nums[left]
        min_length = [min_length, curr_window_size].min
        left += 1
      end
    end

    min_length.infinite? ? 0 : min_length
  end
end

# Test
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([2, 1, 5, 2, 3, 2], 7)

    assert_equal(2, solution)
  end

  def test_case2
    solution = Solution.new.solution([2, 1, 5, 2, 8], 7)

    assert_equal(1, solution)
  end

  def test_case3
    solution = Solution.new.solution([3, 4, 1, 1, 6], 8)

    assert_equal(3, solution)
  end

  def test_case4
    solution = Solution.new.solution([1, 1, 1, 1, 1], 1000)

    assert_equal(0, solution)
  end
end
