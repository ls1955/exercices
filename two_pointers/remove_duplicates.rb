# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given an array of sorted numbers, remove
  all duplicates from it. You should not use
  any extra space. After removing the duplicates
  in-place return the new length of the array.
STATEMENT

# Solution
class Solution
  def solution(nums)
    left = 0

    (1...(nums.length)).each do |right|
      if nums[left] != nums[right]
        left += 1
        nums[left] = nums[right]
      end
    end

    left + 1
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([2, 3, 3, 3, 6, 9, 9])
    expected = 4

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([2, 2, 2, 11])
    expected = 2

    assert_equal(expected, solution)
  end
end
