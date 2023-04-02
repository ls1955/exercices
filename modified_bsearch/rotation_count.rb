# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given an array of numbers which is sorted in
  ascending order and is rotated ‘k’ times
  around a pivot, find ‘k’.

  You can assume that the array does not have
  any duplicates.
STATEMENT

# Solution
class Solution
  def solution(nums)
    nums.bsearch_index { |num| num < nums[-1] } || nums.length - 1
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [10, 15, 1, 3, 8]
    solution = Solution.new.solution(nums)
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [4, 5, 7, 9, 10, -1, 2]
    solution = Solution.new.solution(nums)
    expected = 5

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [1, 3, 8, 10]
    
    nums.length.times do |i|
      solution = Solution.new.solution(nums.rotate(-i))
      expected = i

      assert_equal(solution, expected)
    end
  end
end
