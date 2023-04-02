# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/array_reader'

puts <<~STATEMENT
  Given an infinite sorted array (or an array
  with unknown size), find if a given number
  ‘key’ is present in the array. Write a
  function to return the index of the ‘key’
  if it is present in the array, otherwise
  return -1.

  Since it is not possible to define an array
  with infinite (unknown) size, you will be
  provided with an interface ArrayReader to
  read elements of the array. ArrayReader.get(index)
  will return the number at index; if the array’s size
  is smaller than the index, it will return Integer.MAX_VALUE.
STATEMENT

# Solution
class Solution
  def solution(reader, key)
    (0..).bsearch { |index| key <=> reader[index] } || -1
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    nums = [4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
    reader = ArrayReader.new(nums)
    solution = Solution.new.solution(reader, 16)
    expected = 6

    assert_equal(expected, solution)
  end

  def test_case2
    nums = [4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
    reader = ArrayReader.new(nums)
    solution = Solution.new.solution(reader, 11)
    expected = -1

    assert_equal(expected, solution)
  end

  def test_case3
    nums = [1, 3, 8, 10, 15]
    reader = ArrayReader.new(nums)
    solution = Solution.new.solution(reader, 15)
    expected = 4

    assert_equal(expected, solution)
  end

  def test_case4
    nums = [1, 3, 8, 10, 15]
    reader = ArrayReader.new(nums)
    solution = Solution.new.solution(reader, 200)
    expected = -1

    assert_equal(expected, solution)
  end
end
