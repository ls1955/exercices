# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/bitonic_array_lib'

puts <<~STATEMENT
  Given a Bitonic array, find if a given ‘key’ is present in it.
  Write a function to return the index of the ‘key’. If the ‘key’
  is not present, return -1.
STATEMENT

Array.include BitonicArrayLib

# Solution
class Solution
  def solution(nums, key)
    nums.bitonic_bsearch_index(key, default: -1)
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [1, 3, 8, 4, 3]
    key = 4
    solution = Solution.new.solution(nums, key)
    expected = 3

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [3, 8, 3, 1]
    key = 8
    solution = Solution.new.solution(nums, key)
    expected = 1

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [1, 3, 8, 12]
    key = 12
    solution = Solution.new.solution(nums, key)
    expected = 3

    assert_equal(expected, solution)
  end

  def test_case4
    nums = [10, 9, 8]
    key = 10
    solution = Solution.new.solution(nums, key)
    expected = 0

    assert_equal(expected, solution)
  end
end
