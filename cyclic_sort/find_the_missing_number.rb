# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  We are given an array containing ‘n’
  distinct numbers taken from the range
  0 to ‘n’. Since the array has only ‘n’
  numbers out of the total ‘n+1’ numbers,
  find the missing number.
STATEMENT

class Array
  def cyclic_sort!
    i = 0

    while i < self.length
      if self[i] == self.length || self[i] == i
        i += 1
      else
        self[i], self[self[i]] = self[self[i]], self[i]
      end
    end

    self
  end
end

# Solution
class Solution
  def solution(nums)
    nums.cyclic_sort!
    nums.each_with_index { |num, i| return i unless num == i }
    nums.length
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([4, 0, 3, 1])
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([8, 3, 5, 2, 4, 6, 0, 1])
    expected = 7

    assert_equal(expected, solution)
  end
end
