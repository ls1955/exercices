# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given the head of a Singly LinkedList,
  write a function to determine if the
  LinkedList has a cycle in it or not.
STATEMENT

# Solution
class Solution
  def solution; end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution
    expected = 0

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution
    expected = 0

    assert_equal(expected, solution)
  end
end
