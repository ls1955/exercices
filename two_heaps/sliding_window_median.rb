# frozen_string_literal: false

require 'algorithms'
require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given an array of numbers and a number k,
  find the median of all k sized sub-arrays.
STATEMENT

# Solution
class Solution
  include Containers

  def solution(nums, k_counter)
    result = []
    left = 0
    left_part = MaxHeap.new
    right_part = MinHeap.new

    nums.each_with_index do |num, right|
      left_part << num
      right_part << left_part.pop

      left_part << right_part.pop if left_part.length < right_part.length

      if (right - left + 1) == k_counter
        result << median(left_part, right_part)

        if left_part.has_key?(nums[left])
          left_part.delete(nums[left])

          left_part << right_part.pop if left_part.length < right_part.length
        else
          right_part.delete(nums[left])

          right_part << left_part.pop if (right_part.length - left_part.length).abs >= 2
        end
        left += 1
      end
    end
    result
  end

  def median(left_part, right_part)
    left_part.length > right_part.length ?
    left_part.next :
    (left_part.next + right_part.next).fdiv(2)
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [1, 2, -1, 3, 5]
    solution = Solution.new.solution(nums, 2)
    expected = [1.5, 0.5, 1.0, 4.0]

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [1, 2, -1, 3, 5]
    solution = Solution.new.solution(nums, 3)
    expected = [1.0, 2.0, 3.0]

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [1, 2, -1, 3, 5]
    solution = Solution.new.solution(nums, 1)
    expected = [1, 2, -1, 3, 5]

    assert_equal(expected, solution)
  end
end
