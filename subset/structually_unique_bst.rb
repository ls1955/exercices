# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given a number num, write a function
  to return the amount of structurally
  unique Binary Search Trees (BST) that
  can store values 1 to num.
STATEMENT

# Solution
class Solution
  def solution(num)
    return 1 if num <= 1

    result = 0

    (1..num).each do |i|
      result += (solution(i - 1) * solution(num - i))
    end
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution(2)
    expected = 2

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution(3)
    expected = 5

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution(1)
    expected = 1

    assert_equal(expected, solution)
  end
end
