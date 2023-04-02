# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Identical with 'search in rotated array' problem,
  but nums might have duplicates
STATEMENT

# Solution
class Solution
  def solution(nums, key)
    left = 0
    right = nums.length - 1

    while left <= right
      mid = (left + right) / 2

      return mid if nums[mid] == key

      while nums[left] == nums[mid] && nums[mid] == nums[right]
        left += 1
        right -= 1
      end

      if nums[left] <= nums[mid]
        key.between?(nums[left], nums[mid]) ? right = mid - 1 : left = mid + 1
      else
        key.between?(nums[mid], nums[right]) ? left = mid + 1 : right = mid - 1
      end
    end
    -1
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [3, 7, 3, 3, 3]
    key = 7
    solution = Solution.new.solution(nums, key)
    expected = 1

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [3, 7, 3, 3, 3]
    key = 0
    solution = Solution.new.solution(nums, key)
    expected = -1

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [3, 7, 3, 3, 3]
    key = 3
    solution = Solution.new.solution(nums, key)
    expected = [0, 2, 3, 4]

    assert_includes(expected, solution)
  end
end
