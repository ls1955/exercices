# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given an array of unsorted numbers and
  a target number, find a triplet in the
  array whose sum is as close to the target
  number as possible, return the sum of the
  triplet. If there are more than one such
  triplet, return the sum of the triplet with
  the smallest sum.
STATEMENT

# Solution
class Solution
  def solution(nums, target)
    diff = Float::INFINITY
    sum = 0
    nums.sort!

    (nums.length - 2).times do |i|
      left = i + 1
      right = nums.length - 1

      while left < right
        curr_sum = nums[i] + nums[left] + nums[right]
        curr_diff = (target - curr_sum).abs

        if curr_diff < diff
          diff = curr_diff
          sum = curr_sum
        end

        curr_sum > target ? right -= 1 : left += 1
      end
    end

    sum
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([-2, 0, 1, 2], 2)
    expected = 1

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([-3, -1, 1, 2], 1)
    expected = 0

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([1, 0, 1, 1], 100)
    expected = 3

    assert_equal(expected, solution)
  end
end
