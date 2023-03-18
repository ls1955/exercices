# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'

puts <<~STATEMENT
  Given a string, find all of its permutations preserving
  the character sequence but changing case.
STATEMENT

# Solution
class Solution
  def solution(string)
    queue = ['']

    string.each_char do |char|
      queue.length.times do
        curr = queue.shift

        queue << (curr + char)
        queue << (curr + char.swapcase) unless char.between?('0', '9')
      end
    end
    queue
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution('ad52')
    expected = %w[ad52 Ad52 aD52 AD52]

    assert_equal(expected.sort, solution.sort)
  end

  def test_case2
    solution = Solution.new.solution('ab7c')
    expected = %w[ab7c Ab7c aB7c AB7c ab7C Ab7C aB7C AB7C]

    assert_equal(expected.sort, solution.sort)
  end

  def test_case3
    solution = Solution.new.solution('a')
    expected = %w[a A]

    assert_equal(expected.sort, solution.sort)
  end
end
