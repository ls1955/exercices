# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given a string and a pattern, find the
  smallest substring in the given string
  which has all the characters of the given pattern.
STATEMENT

# Solution
class Solution
  def solution(string, pattern)
    return '' if string.length < pattern.length

    hash = pattern.chars.tally
    req_char_count = hash.length
    min_length = Float::INFINITY
    min_left = 0
    left = 0

    string.each_char.with_index do |char, right|
      if hash[char]
        hash[char] -= 1

        req_char_count -= 1 if hash[char].zero?
      end

      while req_char_count.zero?
        curr_length = right - left + 1

        if curr_length < min_length
          min_left = left
          min_length = curr_length
        end

        if hash[string[left]]
          req_char_count += 1 if hash[string[left]].zero?

          hash[string[left]] += 1
        end

        left += 1
      end
    end

    min_length == Float::INFINITY ? '' : string[min_left, min_length]
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution('aabdec', 'abc')
    expected = 'abdec'

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution('abdabca', 'abc')
    expected = 'abc'

    assert_equal(expected, solution)
  end

  def test_case3
    solution = Solution.new.solution('adcad', 'abc')
    expected = ''

    assert_equal(expected, solution)
  end
end
