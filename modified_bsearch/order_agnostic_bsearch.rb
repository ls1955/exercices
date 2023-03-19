# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given a sorted array of numbers, find if a
  given number ‘key’ is present in the array.
  Though we know that the array is sorted,
  we don’t know if it’s sorted in ascending
  or descending order. You should assume
  that the array can have duplicates.

  Write a function to return the index of the
  ‘key’ if it is present in the array,
  otherwise return -1.
STATEMENT

# Solution
class Solution
  def solution(nums, target)
    is_ascend = nums[0] <= nums[-1]

    nums.bsearch_index do |num|
      (is_ascend ? target <=> num : -(target <=> num))
    end || -1
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [4, 6, 10]
    solution = Solution.new.solution(nums, 10)
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [1, 2, 3, 4, 5, 6, 7]
    solution = Solution.new.solution(nums, 5)
    expected = 4

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [10, 6, 4]
    solution = Solution.new.solution(nums, 10)
    expected = 0

    assert_equal(expected, solution)
  end

  def test_case4
    nums = [10, 6, 4]
    solution = Solution.new.solution(nums, 4)
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case5
    nums = [10, 10, 10]
    solution = Solution.new.solution(nums, 10)
    expected = (0..2)

    assert_includes(expected, solution)
  end

  def test_case6
    nums = [1, 1, 2, 4]
    solution = Solution.new.solution(nums, 10)
    expected = -1

    assert_equal(expected, solution)
  end

  def test_case7
    nums = [10, 9, 8, 7]
    solution = Solution.new.solution(nums, 1)
    expected = -1

    assert_equal(expected, solution)
  end

  def test_case8
    nums = [1]
    solution = Solution.new.solution(nums, 1)
    expected = 0

    assert_equal(expected, solution)
  end

  def test_case9
    nums = [1]
    solution = Solution.new.solution(nums, 99)
    expected = -1

    assert_equal(expected, solution)
  end
end
