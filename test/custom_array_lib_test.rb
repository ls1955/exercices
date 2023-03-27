# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/custom_array_lib'

Array.include CustomArrayLib

# Tests for #lbsearch_index and #lbsearch.
# Although integer is use in the test, it should
# work with every comparable object theoritically.
class CustomArrayLibLsearchTest < Minitest::Test
  def test_target_exist
    nums = [1, 2, 3, 5, 7, 11]
    target = 7

    index = nums.lbsearch_index(target)
    num = nums.lbsearch(target)

    assert_equal(index, 4)
    assert_equal(num, 7)
  end

  def test_target_not_exist_and_has_smaller_num
    nums = [1, 2, 3, 5, 7, 11]
    target = 4

    index = nums.lbsearch_index(target)
    num = nums.lbsearch(target)

    assert_equal(index, 2)
    assert_equal(num, 3)
  end

  def test_target_is_smallest_num
    nums = [1, 2, 3, 5, 7, 11]
    target = -1

    index = nums.lbsearch_index(target)
    num = nums.lbsearch(target)

    assert_nil(index)
    assert_nil(num)
  end

  def test_target_is_biggest_num
    nums = [1, 2, 3, 5, 7, 11]
    target = 13

    index = nums.lbsearch_index(target)
    num = nums.lbsearch(target)

    assert_equal(index, 5)
    assert_equal(num, 11)
  end

  def test_has_target_with_one_num
    nums = [1]
    target = 1

    index = nums.lbsearch_index(target)
    num = nums.lbsearch(target)

    assert_equal(index, 0)
    assert_equal(num, 1)
  end

  def test_target_is_smallest_num_with_one_num
    nums = [1]
    target = -1

    index = nums.lbsearch_index(target)
    num = nums.lbsearch(target)

    assert_nil(index)
    assert_nil(num)
  end

  def test_target_is_biggest_num_with_one_num
    nums = [1]
    target = 11

    index = nums.lbsearch_index(target)
    num = nums.lbsearch(target)

    assert_equal(index, 0)
    assert_equal(num, 1)
  end
end

# Tests for #rsearch_index and #rsearch
class CustomArrayLibRsearchTest < Minitest::Test
  def test_target_exist_and_has_greater_num
    nums = [1, 2, 3, 5, 7, 11]
    target = 7

    index = nums.rbsearch_index(target)
    num = nums.rbsearch(target)

    assert_equal(index, 5)
    assert_equal(num, 11)
  end

  def test_target_not_exist_and_has_greater_num
    nums = [1, 2, 3, 5, 7, 11]
    target = 8

    index = nums.rbsearch_index(target)
    num = nums.rbsearch(target)

    assert_equal(index, 5)
    assert_equal(num, 11)
  end

  def test_target_is_biggest_num
    nums = [1, 2, 3, 5, 7, 11]
    target = 11

    index = nums.rbsearch_index(target)
    num = nums.rbsearch(target)

    assert_nil(index)
    assert_nil(num)
  end

  def test_target_is_smallest_num
    nums = [1, 2, 3, 5, 7, 11]
    target = -1

    index = nums.rbsearch_index(target)
    num = nums.rbsearch(target)

    assert_equal(index, 0)
    assert_equal(num, 1)
  end

  def test_target_is_biggest_num_with_one_num
    nums = [1]
    target = 2

    index = nums.rbsearch_index(target)
    num = nums.rbsearch(target)

    assert_nil(index)
    assert_nil(num)
  end

  def test_target_is_smallest_num_with_one_num
    nums = [1]
    target = -1

    index = nums.rbsearch_index(target)
    num = nums.rbsearch(target)

    assert_equal(index, 0)
    assert_equal(num, 1)
  end
end
