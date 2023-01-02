# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given an array of unsorted numbers, find
  all unique triplets in it that add up to zero.
STATEMENT

# Solution
class Solution
  def solution(nums)
    nums.sort!
    result = []

    nums.each_with_index do |num, i|
      next if i > 0 && nums[i] == nums[i - 1]

      break if num.positive?

      left = i + 1
      right = nums.length - 1

      while left < right
        sum = num + nums[left] + nums[right]

        if sum.negative?
          left += 1
        elsif sum.positive?
          right -= 1
        else
          result << [num, nums[left], nums[right]]

          left += 1
          right -= 1

          left += 1 while left < right && nums[left] == nums[left - 1]
        end
      end
    end

    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([-3, 0, 1, 2, -1, 1, -2])
    expected = [[-3, 1, 2], [-2, 0, 2], [-2, 1, 1], [-1, 0, 1]]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([-5, 2, -1, -2, 3])
    expected = [[-5, 2, 3], [-2, -1, 3]]

    assert_equal(expected, solution)
  end
end
