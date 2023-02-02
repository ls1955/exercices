# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require 'set'

puts <<~STATEMENT

STATEMENT

# Solution
class Solution
  def solution(nums, k)
    result = []
    extra_nums = Set.new

    cyclic_sort!(nums)
    nums.each_with_index do |num, index|
      break if result.length == k

      correct_num = index + 1

      unless num == correct_num
        result << correct_num
        extra_nums << num
      end
    end

    ((nums.length + 1)..).each do |num|
      break if result.length == k

      next if extra_nums.include?(num)

      result << num
    end

    result
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
    solution = Solution.new.solution([3, -1, 4, 5, 5], 3)
    expected = [1, 2, 6]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([2, 3, 4], 3)
    expected = [1, 5, 6]

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([-2, -3, 4], 2)
    expected = [1, 2]

    assert_equal(expected, solution)
  end
end
