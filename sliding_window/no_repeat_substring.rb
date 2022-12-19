# frozen_string_literal: false

require 'minitest/autorun'

puts <<~HEREDOC
  Problem Statement #
  Given a string, find the length of the longest substring
  which has no repeating characters.
HEREDOC

# Solution
class Solution
  def solution(string)
    max_length = 0
    left = 0

    string.each_char.with_index.with_object({}) do |(char, right), hash|
      left = [left, hash[char] + 1].max if hash[char]

      hash[char] = right
      max_length = [max_length, right - left + 1].max
    end

    max_length
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution('aabccbb')

    assert_equal(3, solution)
  end

  def test_case2
    solution = Solution.new.solution('abbbb')

    assert_equal(2, solution)
  end

  def test_case3
    solution = Solution.new.solution('abccde')

    assert_equal(3, solution)
  end
end
