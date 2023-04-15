# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  For a given positive number N in base-10,
  return the complement of its binary
  representation as a base-10 integer.
STATEMENT

# Solution
class Solution
  def solution(num)
    mask_num = 0

    mask_num = (mask_num << 1) | 1 until mask_num >= num
    num ^ mask_num
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    num = 8
    solution = Solution.new.solution(num)
    expected = 7

    assert_equal(expected, solution)
  end

  def test_case2
    num = 10
    solution = Solution.new.solution(num)
    expected = 5

    assert_equal(expected, solution)
  end
end
