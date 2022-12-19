# frozen_string_literal: false

require 'minitest/autorun'

puts <<~HEREDOC
  Problem Statement #
  Given a string with lowercase letters only,
  if you are allowed to replace no more than
  ‘k’ letters with any letter, find the length
  of the longest substring having the same letters after replacement.
HEREDOC

# Solution
class Solution
  def solution(string, k)
    left = 0
    hash = {}
    hash.default = 0
    # the curr max freq char count
    curr_lead_char_count = 0

    string.each_char.with_index.reduce(0) do |max_length, (char, right)|
      hash[char] += 1
      curr_lead_char_count = [curr_lead_char_count, hash[char]].max

      if right - left + 1 - curr_lead_char_count > k
        hash[string[left]] -= 1
        left += 1
      end

      [max_length, right - left + 1].max
    end
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution('aabccbb', 2)

    assert_equal(5, solution)
  end

  def test_case2
    solution = Solution.new.solution('abbcb', 1)

    assert_equal(4, solution)
  end

  def test_case3
    solution = Solution.new.solution('abccde', 1)

    assert_equal(3, solution)
  end
end
