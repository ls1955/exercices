# frozen_string_literal: false

require 'minitest/autorun'

puts <<~HEREDOC
Problem Statement #
  Given an array of characters where each character represents a fruit tree,
  you are given two baskets and your goal is to put maximum number of fruits in each basket.
  The only restriction is that each basket can have only one type of fruit.

  You can start with any tree, but once you have started you can’t skip a tree.
  You will pick one fruit from each tree until you cannot,
  i.e., you will stop when you have to pick from a third fruit type.

  Write a function to return the maximum number of fruits in both the baskets.
HEREDOC

# Solution
class Solution
  def solution(fruits)
    max_fruit = 0
    hash = {}
    left = 0
    hash.default = 0

    fruits.each_with_index do |fruit, right|
      hash[fruit] += 1

      while hash.length > 2
        hash[fruits[left]] -= 1

        hash.delete(fruits[left]) if hash[fruits[left]].zero?

        left += 1
      end

      max_fruit = [max_fruit, right - left + 1].max
    end

    max_fruit
  end
end

# Tests
class SolutionTest < Minitest::Test
  def test_case1
    solution = Solution.new.solution(%w[A B C A C])

    assert_equal(3, solution)
  end

  def test_case2
    solution = Solution.new.solution(%w[A B C B B C])

    assert_equal(5, solution)
  end
end
