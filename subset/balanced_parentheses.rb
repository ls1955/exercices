# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  For a given number ‘N’, write a function to
  generate all combination of ‘N’ pairs of
  balanced parentheses.
STATEMENT

# Solution
class Solution
  def solution(num)
    result = []
    dfs = lambda do |open, close, str|
      return result << str if str.length == 2 * num

      dfs.call(open + 1, close, str + '(') if open < num
      dfs.call(open, close + 1, str + ')') if close < open
    end

    dfs.call(0, 0, '')
    result
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution(2)
    expected = %w[(()) ()()]

    assert_equal(expected.sort, solution.sort)
  end

  def test_case2
    solution = Solution.new.solution(3)
    expected = %w[((())) (()()) (())() ()(()) ()()()]

    assert_equal(expected.sort, solution.sort)
  end

  def test_case3
    solution = Solution.new.solution(1)
    expected = %w[()]

    assert_equal(expected.sort, solution.sort)
  end
end
