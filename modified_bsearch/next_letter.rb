# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given an array of lowercase letters sorted
  in ascending order, find the smallest letter
  in the given array greater than a given ‘key’.

  Assume the given array is a circular list,
  which means that the last letter is assumed
  to be connected with the first letter. This
  also means that the smallest letter in the
  given array is greater than the last letter
  of the array and is also the first letter of
  the array.

  Write a function to return the next letter of
  the given ‘key’.
STATEMENT

# Solution
class Solution
  def solution(chars, key)
    chars.bsearch do |char|
      char > key
    end || chars.first
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    chars = %w(a c f h)
    solution = Solution.new.solution(chars, 'f')
    expected = 'h'

    assert_equal(expected, solution)
  end

  def test_case2
    chars = %w(a c f h)
    solution = Solution.new.solution(chars, 'b')
    expected = 'c'

    assert_equal(expected, solution)
  end

  def test_case3
    chars = %w(a c f h)
    solution = Solution.new.solution(chars, 'm')
    expected = 'a'

    assert_equal(expected, solution)
  end

  def test_case4
    chars = %w(a c f h)
    solution = Solution.new.solution(chars, 'h')
    expected = 'a'

    assert_equal(expected, solution)
  end
end
