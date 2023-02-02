# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  We are given an unsorted array containing
  ‘n’ numbers taken from the range 1 to ‘n’.
  The array originally contained all the
  numbers from 1 to ‘n’, but due to a data
  error, one of the numbers got duplicated
  which also resulted in one number going
  missing. Find both these numbers.
STATEMENT

# Solution
class Solution
  def solution(nums)
    cyclic_sort!(nums)

    nums.each_with_index do |num, index|
      correct_num = index + 1
      return [num, correct_num] unless num == correct_num
    end

    []
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
    solution = Solution.new.solution([3, 1, 2, 5, 2])
    expected = [2, 4]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([3, 1, 2, 3, 6, 4])
    expected = [3, 5]

    assert_equal(expected, solution)
  end
end
