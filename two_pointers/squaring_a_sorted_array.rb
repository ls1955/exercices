# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given a sorted array, create a new
  array containing squares of all the
  number of the input array in the sorted
  order.
STATEMENT

# Solution
class Solution
  def solution(nums)
    left = 0
    right = nums.length - 1

    right.downto(0).each.with_object([]) do |insert_pos, result|
      left_sqr = nums[left]**2
      right_sqr = nums[right]**2

      if left_sqr >= right_sqr
        result[insert_pos] = left_sqr

        left += 1
      else
        result[insert_pos] = right_sqr

        right -= 1
      end
    end
  end

  def ruby_is_cool(nums)
    nums.map { |num| num**2 }.sort
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([-2, -1, 0, 2, 3])
    expected = [0, 1, 4, 4, 9]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([-3, -1, 0, 1, 2])
    expected = [0, 1, 1, 4, 9]

    assert_equal(expected, solution)
  end
end
