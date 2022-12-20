# frozen_string_literal: false

require 'minitest/autorun'

puts <<~HEREDOC
  Given a string and a pattern,
  find all anagrams of the pattern in the given string.
  Write a function to return a list of starting indices
  of the anagrams of the pattern in the given string.
HEREDOC

# Solution
class Solution
  def solution(string, pattern)
    hash = pattern.chars.tally
    left = 0
    founded_amount = 0
    results = []

    string.each_char.with_index do |char, right|
      if hash[char]
        hash[char] -= 1

        founded_amount += 1 if hash[char].zero?
      end

      results << left if founded_amount == hash.length

      if (right - left + 1) == pattern.length
        if hash[string[left]]
          founded_amount -= 1 if hash[string[left]].zero?

          hash[string[left]] += 1
        end

        left += 1
      end
    end

    results
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution('ppqp', 'pq')
    expected = [1, 2]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution('abbcabc', 'abc')
    expected = [2, 3, 4]

    assert_equal(expected, solution)
  end
end
