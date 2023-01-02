# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given an unsorted array of numbers and a target ‘key’,
  remove all instances of ‘key’ in-place and return the
  new length of the array.
STATEMENT

# Solution
class Solution
  def solution(nums, key)
    insert_posi = 0

    nums.each do |num|
      if num != key
        nums[insert_posi] = num
        insert_posi += 1
      end
    end

    insert_posi
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([3, 2, 3, 6, 3, 10, 9, 3], 3)
    expected = 4

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([2, 11, 2, 2, 1], 2)
    expected = 2

    assert_equal(expected, solution)
  end
end
