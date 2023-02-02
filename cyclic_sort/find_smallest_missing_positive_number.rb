# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given an unsorted array containing
  numbers, find the smallest missing
  positive number in it.
STATEMENT

# Solution
class Solution
  def solution(nums)
    cyclic_sort!(nums)
    nums.each_with_index do |num, index|
      correct_num = index + 1
      return correct_num unless num == correct_num
    end

    nums.length + 1
  end

  def cyclic_sort!(nums)
    i = 0

    while i < nums.length
      index = nums[i] - 1

      if !placeble?(nums, nums[i]) || nums[i] == nums[index]
        i += 1
      else
        nums[i], nums[index] = nums[index], nums[i]
      end
    end
    nums
  end

  def placeble?(nums, num)
    num.between?(1, nums.length)
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([-3, 1, 5, 4, 2])
    expected = 3

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([3, -2, 0, 1, 2])
    expected = 4

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([3, 2, 5, 1])
    expected = 4

    assert_equal(expected, solution)
  end
end
