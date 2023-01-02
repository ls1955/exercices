# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given an array arr of unsorted numbers and
  a target sum, count all triplets in it such
  that arr[i] + arr[j] + arr[k] < target where
  i, j, and k are three different indices.
  Write a function to return the count of such
  triplets.
STATEMENT

# Solution
class Solution
  def solution(nums, target)
    triplet_count = 0
    nums.sort!

    (nums.length - 2).times do |i|
      left = i + 1
      right = nums.length - 1

      while left < right
        curr_sum = nums[i] + nums[left] + nums[right]

        if curr_sum < target
          triplet_count += (right - left)
          left += 1
        else
          right -= 1
        end
      end
    end

    triplet_count
  end

  def brute_force(nums, target)
    triplet_count = 0

    (nums.length - 2).times do |i|
      ((i + 1)...(nums.length - 1)).each do |j|
        ((j + 1)...nums.length).each do |k|
          curr_sum = nums[i] + nums[j] + nums[k]

          triplet_count += 1 if curr_sum < target
        end
     end
    end

    triplet_count
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([-1, 0, 2, 3], 3)
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([-1, 4, 2, 1, 3], 5)
    expected = 4

    assert_equal(expected, solution)
  end
end
