# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given a binary matrix representing an image,
  we want to flip the image horizontally, then
  invert it.

  To flip an image horizontally means that each
  row of the image is reversed. For example,
  flipping [0, 1, 1] horizontally results in [1, 1, 0].
STATEMENT

# Solution
class Solution
  def solution(matrix)
    matrix.map!(&:reverse).each { |arr| arr.map! { |num| num ^ 1 } }
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    matrix = [
      [1, 0, 1],
      [1, 1, 1],
      [0, 1, 1]
    ]
    solution = Solution.new.solution(matrix)
    expected = [
      [0, 1, 0],
      [0, 0, 0],
      [0, 0, 1]
    ]

    assert_equal(expected, solution)
  end

  def test_case2
    matrix = [
      [1, 1, 0, 0],
      [1, 0, 0, 1],
      [0, 1, 1, 1], 
      [1, 0, 1, 0]
    ]
    solution = Solution.new.solution(matrix)
    expected = [
      [1, 1, 0, 0],
      [0, 1, 1, 0],
      [0, 0, 0, 1],
      [1, 0, 1, 0]
    ]

    assert_equal(expected, solution)
  end
end
