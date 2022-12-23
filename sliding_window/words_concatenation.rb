# frozen_string_literal: false

require 'minitest/autorun'

puts <<~STATEMENT
  Given a string and a list of words, find all
  the starting indices of substrings in the given
  string that are a concatenation of all the given
  words exactly once without any overlapping of words.
  It is given that all words are of the same length.
STATEMENT

# Solution
class Solution
  def solution(string, words)
    hash = words.tally
    word_len = words[0].length
    window_size = word_len * words.length

    (string.length - window_size + 1).times.with_object([]) do |left, results|
      curr_hash = {}

      words.length.times do |right|
        real_right = left + (word_len * right)
        curr_word = string[real_right, word_len]

        break unless hash[curr_word]

        curr_hash[curr_word] = (curr_hash[curr_word] || 0) + 1

        break if curr_hash[curr_word] > hash[curr_word]
      end

      results << left if curr_hash == hash
    end
  end

  def brute_force(string, words)
    possible_combination = words.permutation.with_object({}) do |permu, hash|
      key = permu.join
      hash[key] = true
    end
    window_size = words.length * words[0].length
    curr_string = ''
    left = 0

    string.each_char.with_index.with_object([]) do |(char, right), results|
      curr_string << char

      if (right - left + 1) == window_size
        results << left if possible_combination[curr_string]

        curr_string[0] = ''
        left += 1
      end
    end
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution('catfoxcat', %w[cat fox])
    expected = [0, 3]

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution('catcatfoxfox', %w[cat fox])
    expected = [3]

    assert_equal(expected, solution)
  end
end
