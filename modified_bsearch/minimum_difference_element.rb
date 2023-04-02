# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/custom_array_lib'

puts <<~STATEMENT
  Given an array of numbers sorted in ascending
  order, find the element in the array that has
  the minimum difference with the given ‘key’.
STATEMENT

Array.include CustomArrayLib

# Solution
class Solution
  def solution(nums, key)
    left_num = nums.lbsearch(key) || -Float::INFINITY
    right_num = nums.rbsearch(key) || Float::INFINITY
    left_diff = key - left_num
    right_diff = right_num - key

    left_diff < right_diff ? left_num : right_num
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [4, 6, 10]
    key = 7

    solution = Solution.new.solution(nums, key)
    expected = 6

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [4, 6, 10]
    key = 4

    solution = Solution.new.solution(nums, key)
    expected = 4

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [4, 6, 10]
    key = 17

    solution = Solution.new.solution(nums, key)
    expected = 10

    assert_equal(expected, solution)
  end

  def test_case4
    nums = [1, 3, 8, 10, 15]
    key = 12

    solution = Solution.new.solution(nums, key)
    expected = 10

    assert_equal(expected, solution)
  end
end
