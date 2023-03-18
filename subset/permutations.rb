# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given a set of distinct numbers, find all of its permutations.
STATEMENT

# Solution
class Solution
  def solution(nums)
    result = []

    backtrack([], nums, result)
    result
  end

  def backtrack(curr, nums, result)
    if curr.length == nums.length
      result << curr.dup
      return
    end

    nums.each do |num|
      next if curr.include?(num)

      curr << num
      backtrack(curr, nums, result)
      curr.pop
    end
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([1])
    expected = [[1]]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([1, 2])
    expected = [[1, 2], [2, 1]]

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([1,3,5])
    expected = [[1,3,5], [1,5,3], [3,1,5], [3,5,1], [5,1,3], [5,3,1]]

    assert_equal(expected.sort, solution.sort)
  end
end
