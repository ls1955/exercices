# frozen_string_literal: false

require 'minitest/autorun'

puts <<~HEREDOC

HEREDOC

# Solution
class Solution
  def solution; end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution

    assert_equal(2, solution)
  end

  def test_case2
    solution = Solution.new.solution

    assert_equal(2, solution)
  end
end
