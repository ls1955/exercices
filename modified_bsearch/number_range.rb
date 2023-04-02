# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given an array of numbers sorted in ascending
  order, find the range of a given number ‘key’.
  The range of the ‘key’ will be the first and
  last position of the ‘key’ in the array.

  Write a function to return the range of the
  ‘key’. If the ‘key’ is not present return [-1, -1].
STATEMENT

# Solution
class Solution
  def solution(nums, key)
    start_index = nums.bsearch_index { |num| num >= key }

    return [-1, -1] if !start_index || nums[start_index] != key

    end_index = (nums.bsearch_index { |num| num > key } || nums.length) - 1
    [start_index, end_index]
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [4, 6, 6, 6, 9]
    solution = Solution.new.solution(nums, 6)
    expected = [1, 3]

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [1, 3, 8, 10, 15]
    solution = Solution.new.solution(nums, 10)
    expected = [3, 3]

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [1, 3, 8, 10, 15]
    solution = Solution.new.solution(nums, 12)
    expected = [-1, -1]

    assert_equal(expected, solution)
  end
end
