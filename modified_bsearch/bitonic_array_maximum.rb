# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/bitonic_array_lib'

puts <<~STATEMENT
  Find the maximum value in a given Bitonic array.
  An array is considered bitonic if it is monotonically
  increasing and then monotonically decreasing.
  Monotonically increasing or decreasing means that
  for any index i in the array arr[i] != arr[i+1].
STATEMENT

Array.include BitonicArrayLib

# Solution
class Solution
  def solution(nums)
    nums.bitonic_max
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [1, 3, 8, 12, 4, 2]
    solution = Solution.new.solution(nums)
    expected = 12

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [3, 8, 3, 1]
    solution = Solution.new.solution(nums)
    expected = 8

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [1, 3, 8, 12]
    solution = Solution.new.solution(nums)
    expected = 12

    assert_equal(expected, solution)
  end

  def test_case4
    nums = [10, 9, 8]
    solution = Solution.new.solution(nums)
    expected = 10

    assert_equal(expected, solution)
  end
end
