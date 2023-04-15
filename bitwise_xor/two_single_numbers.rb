# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  In a non-empty array of numbers, every number
  appears exactly twice except two numbers that
  appear only once. Find the two numbers that
  appear only once.
STATEMENT

# Solution
class Solution
  def solution(nums)
    xor_sum = nums.reduce(&:^)
    diff = xor_sum & -xor_sum
    nums.partition { |num| (num & diff).zero? }.map { |arr| arr.reduce(&:^) }
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [1, 4, 2, 1, 3, 5, 6, 2, 3, 5]
    solution = Solution.new.solution(nums)
    expected = [4, 6]

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [2, 1, 3, 2]
    solution = Solution.new.solution(nums)
    expected = [1, 3]

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [2, 3]
    solution = Solution.new.solution(nums)
    expected = [2, 3]

    assert_equal(expected, solution)
  end
end
