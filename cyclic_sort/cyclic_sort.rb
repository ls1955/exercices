# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given an array containing ‘n’ objects
  where each object was assigned a unique
  number from 1 to ‘n’. Write a function
  to sort the objects in-place
STATEMENT

# Solution
class Solution
  def solution(nums)
    i = 0

    while i < nums.length
      correct_index = nums[i] - 1

      if nums[i] == nums[correct_index]
        i += 1
      else
        nums[i], nums[correct_index] = nums[correct_index], nums[i]
      end
    end

    nums
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([3, 1, 5, 4, 2])
    expected = [1, 2, 3, 4, 5]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([2, 6, 4, 3, 1, 5])
    expected = [1, 2, 3, 4, 5, 6]

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([1, 5, 6, 4, 3, 2])
    expected = [1, 2, 3, 4, 5, 6]

    assert_equal(expected, solution)
  end
end
