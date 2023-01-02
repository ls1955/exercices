# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given an array of unsorted numbers and a
  target number, find all unique quadruplets
  in it, whose sum is equal to the target number.
STATEMENT

# Solution
class Solution
  def solution(nums, target)
    result = []
    nums.sort!

    0.upto(nums.length - 4) do |a|
      next if a > 0 && nums[a] == nums[a - 1]

      (a + 1).upto(nums.length - 3) do |b|
        next if b > (a + 1) && nums[b] == nums[b - 1]

        two_sum(a, b, nums, target, result)
      end
    end

    result
  end

  def two_sum(a, b, nums, target, result)
    c = b + 1
    d = nums.length - 1

    while c < d
      sum = nums[a] + nums[b] + nums[c] + nums[d]

      if sum < target
        c += 1
      elsif sum > target
        d -= 1
      else
        result << [nums[a], nums[b], nums[c], nums[d]]
        c += 1
        d -= 1

        c += 1 while c < d && nums[c] == nums[c - 1]
        d -= 1 while c < d && nums[d] == nums[d + 1]
      end
    end
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([4, 1, 2, -1, 1, -3], 1)
    expected = [[-3, -1, 1, 4], [-3, 1, 1, 2]]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([2, 0, -1, 1, -2, 2], 2)
    expected = [[-2, 0, 2, 2], [-1, 0, 1, 2]]

    assert_equal(expected, solution)
  end
end
