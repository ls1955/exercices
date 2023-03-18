# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given a set with distinct elements,
  find all of its distinct subsets.
STATEMENT

class Array
  def subset
    result = [[]]

    self.each do |num|
      result = result.concat(result.map { |subset| subset + [num] })
    end
    result
  end
end

# Solution
class Solution
  def solution(nums)
    nums.subset
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([1, 3])
    expected = [[], [1], [3], [1, 3]]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([1, 5, 3])
    expected = [[], [1], [5], [1, 5], [3], [1, 3], [5, 3], [1, 5, 3]]

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution([1])
    expected = [[], [1]]

    assert_equal(expected, solution)
  end
end
