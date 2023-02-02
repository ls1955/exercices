# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  We are given an unsorted array containing
  numbers taken from the range 1 to ‘n’.
  The array can have duplicates, which means
  some numbers will be missing. Find all
  those missing numbers.
STATEMENT

# Solution
class Solution
  def solution(nums)
    cyclic_sort!(nums)
    result = []

    nums.each_with_index do |num, i|
      correct_num = i + 1
      result << correct_num unless num == correct_num
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
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([2, 3, 1, 8, 2, 3, 5, 1])
    expected = [4, 6 ,7]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([2, 4, 1, 2])
    expected = [3]

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([2, 3, 2, 1])
    expected = [4]

    assert_equal(expected, solution)
  end
end
