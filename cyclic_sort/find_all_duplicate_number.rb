# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  We are given an unsorted array containing
  ‘n’ numbers taken from the range 1 to ‘n’.
  The array has some duplicates, find all
  the duplicate numbers without using any
  extra space.
STATEMENT

# Solution
class Solution
  def solution(nums)
    cyclic_sort!(nums)
    result = []

    nums.each_with_index do |num, index|
      correct_num = index + 1
      result << num unless num == correct_num
    end

    result
  end

  def cyclic_sort!(nums)
    i = 0

    while i < nums.length
      index = nums[i] - 1

      if nums[i] == nums[index]
        i += 1
      else
        nums[i], nums[index] = nums[index], nums[i]
      end
    end

    nums
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([3, 4, 4, 5, 5])
    expected = [4, 5]

    assert_equal(expected, solution.sort)
  end

  def test_case2
    solution = Solution.new.solution([5, 4, 7, 2, 3, 5, 3])
    expected = [3, 5]

    assert_equal(expected, solution.sort)
  end
end
