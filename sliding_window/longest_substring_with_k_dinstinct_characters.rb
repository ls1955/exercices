# frozen_string_literal: false

require 'minitest/autorun'

puts <<~HEREDOC
  Problem Statement #
  Given a string, find the length of the longest
  substring in it with no more than K distinct characters.
HEREDOC

# Solution
class Solution
  def solution(string, k)
    max_length = 1
    distinct_count = 0
    hash = {}
    left = 0

    string.length.times do |right|
      if hash.key?(string[right])
        distinct_count += 1 if hash[string[right]].zero?

        hash[string[right]] += 1
      else
        hash[string[right]] = 1

        distinct_count += 1
      end

      while distinct_count > k
        hash[string[left]] -= 1

        distinct_count -= 1 if hash[string[left]].zero?

        left += 1
      end

      curr_window_length = right - left + 1
      max_length = [max_length, curr_window_length].max
    end

    max_length
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution('araaci', 2)

    assert_equal(4, solution)
  end

  def test_case2
    solution = Solution.new.solution('araaci', 1)

    assert_equal(2, solution)
  end

  def test_case3
    solution = Solution.new.solution('cbbebi', 3)

    assert_equal(5, solution)
  end
end
