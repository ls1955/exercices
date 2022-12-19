# frozen_string_literal: false

require 'minitest/autorun'

puts <<~HEREDOC
  Given a string and a pattern,
  find out if the string contains any permutation of the pattern.
HEREDOC

# Solution
class Solution
  def solution(string, pattern)
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution(%w[o i d b c a f], %w[a b c])

    assert_equal(true, solution)
  end

  def test_case2
    solution = Solution.new.solution(%w[o d i c f], %w[d c])

    assert_equal(false, solution)
  end

  def test_case3
    solution = Solution.new.solution(%w[b c d x a b c d y], %w[b c d y a b c d x])

    assert_equal(true, solution)
  end

  def test_case4
    solution = Solution.new.solution(%w[a a a c b], %w[a b c])

    assert_equal(true, solution)
  end
end
