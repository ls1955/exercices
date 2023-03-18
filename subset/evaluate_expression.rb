# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given an expression containing digits and
  operations (+, -, *), find all possible ways
  in which the expression can be evaluated by
  grouping the numbers and operators using parentheses.
STATEMENT

# Solution
class Solution
  def solution(expr)
    result = []

    expr.each_char.with_index do |char, i|
      next if char.match?(/\d/)

      left_result = solution(expr[0...i])
      right_result = solution(expr[i+1..])

      left_result.each do |val1|
        right_result.each do |val2|
          eval "result << (#{val1} #{char} #{val2})"
        end
      end
    end
    result.empty? ? [expr.to_i] : result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution('1+2*3')
    expected = [7, 9]

    assert_equal(expected.sort, solution.sort)
  end

  def test_case2
    solution = Solution.new.solution('2*3-4-5')
    expected = [8, -12, 7, -7, -3]

    assert_equal(expected.sort, solution.sort)
  end
end
