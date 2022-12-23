# frozen_string_literal: false

require 'minitest/autorun'

puts <<~HEREDOC
  Given a string and a pattern,
  find out if the string contains any permutation of the pattern.
HEREDOC

# Solution
class Solution
  def solution(string, pattern)
    hash = pattern.chars.tally
    left = 0
    needed_amount = pattern.length

    string.each_char.with_index do |char, right|
      if hash[char]
        hash[char] -= 1
        needed_amount -= 1
      end

      while needed_amount <= 0 && (right - left + 1) > pattern.length
        if hash[string[left]]
          hash[string[left]] += 1
          needed_amount += 1
        end

        left += 1
      end

      return true if (right - left + 1) == pattern.length && hash.values.all?(0)
    end

    false
  end

  def educative_solution(string, pattern)
    hash = pattern.chars.tally
    left = 0
    founded_amount = 0

    string.each_char.with_index do |char, right|
      if hash[char]
        hash[char] -= 1
        founded_amount += 1 if hash[char].zero?
      end

      return true if founded_amount == hash.length

      if right >= (pattern.length - 1)
        if hash[string[left]]
          founded_amount -= 1 if hash[string[left]].zero?
          hash[string[left]] += 1
        end

        left += 1
      end
    end

    false
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution('oidbcaf', 'abc')

    assert_equal(true, solution)
  end

  def test_case2
    solution = Solution.new.solution('odicf', 'dc')

    assert_equal(false, solution)
  end

  def test_case3
    solution = Solution.new.solution('bcdxabcdy', 'bcdyabcdx')

    assert_equal(true, solution)
  end

  def test_case4
    solution = Solution.new.solution('aaacb', 'abc')

    assert_equal(true, solution)
  end
end
