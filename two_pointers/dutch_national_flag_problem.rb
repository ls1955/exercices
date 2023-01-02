# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given an array containing 0s, 1s and 2s,
  sort the array in-place. You should treat
  numbers of the array as objects, hence, we
  can’t count 0s, 1s, and 2s to recreate the array.
STATEMENT

# Solution
class Solution
  def solution(array)
    left = 0
    mid = 0
    right = array.length - 1

    while mid <= right
      case array[mid]
      when 0
        array[left], array[mid] = array[mid], array[left]
        left += 1
        mid += 1
      when 1
        mid += 1
      else
        array[mid], array[right] = array[right], array[mid]
        right -= 1
      end
    end

    array
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([1, 0, 2, 1, 0])
    expected = [0, 0, 1, 1, 2]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([2, 2, 0, 1, 2, 0])
    expected = [0, 0, 1, 2, 2, 2]

    assert_equal(expected, solution)
  end
end
