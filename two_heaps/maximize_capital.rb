# frozen_string_literal: false

require 'minitest/autorun'
require 'minitest/pride'
require 'algorithms'

puts <<~STATEMENT
  Given a set of investment projects with
  their respective profits, we need to find
  the most profitable projects. We are given
  an initial capital and are allowed to invest
  only in a fixed number of projects. Our goal
  is to choose projects that give us the maximum
  profit.

  We can start an investment project only when
  we have the required capital. Once a project
  is selected, we can assume that its profit has
  become our capital.
STATEMENT

# Solution
class Solution
  include Containers

  def solution(capitals, profits, curr_capital, projects_num)
    # put [capital,profit] sorted with capital
    min_heap = Heap.new { |x, y| (x[0] <=> y[0]) == -1 }
    max_heap = MaxHeap.new

    capitals.each_with_index do |capital, i|
      min_heap << [capital, profits[i]]
    end

    projects_num.times do
      while min_heap.next && min_heap.next[0] <= curr_capital
        max_heap << min_heap.pop[1]
      end

      break if max_heap.empty?

      curr_capital += max_heap.pop
    end
    curr_capital
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution([0, 1, 2], [1, 2, 3], 1, 2)
    expected = 6

    assert_equal(expected, solution)
  end

  def test_case2
    solution = Solution.new.solution([0, 1, 2, 3], [1, 2, 3, 5], 0, 3)
    expected = 8

    assert_equal(expected, solution)
  end
end
