# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT

STATEMENT

# Solution
class Solution
  def solution(nums)
    i = 0

    while i < nums.length
      index = nums[i] - i

      if nums[i] == nums[index]
        if i == index
          i += 1
        else
          return nums[i]
        end
      else
        nums[i], nums[index] = nums[index], nums[i]
      end
    end
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([1, 4, 4, 3, 2])
    expected = 4

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([2, 1, 3, 3, 5, 4])
    expected = 3

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([2, 4, 1, 4, 4])
    expected = 4

    assert_equal(expected, solution)
  end
end
