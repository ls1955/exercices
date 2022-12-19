# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT

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
