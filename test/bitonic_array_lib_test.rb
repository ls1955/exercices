# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/bitonic_array_lib'

Array.include BitonicArrayLib

# Tests of bitonic array, to see the definition
# of bitonic array, refer to bitonic_array_lib.rb
class BitonicArrayLibTest < Minitest::Test
  def test_arr_bitonic_max_is_peak_if_has_peak
    nums = [1, 2, 3, 4, 3, 2, 1]
    result = nums.bitonic_max

    assert_equal(4, result)
  end

  def test_arr_bitonic_max_is_last_num_if_no_peak
    nums = [1, 2, 3, 4, 5, 6, 7]
    result = nums.bitonic_max

    assert_equal(7, result)
  end

  def test_arr_bitonic_bsearch_target_that_exist
    nums = [1, 2, 3, 4, 3, 2, 1]
    target = 4
    result = nums.bitonic_bsearch(target)

    assert_equal(target, result)
  end

  def test_arr_bitonic_bsearch_index_target_that_exist
    nums = [1, 2, 3, 4, 3, 2, 1]
    target = 3
    result = nums.bitonic_bsearch_index(target)

    assert_equal(2, result)
  end

  def test_arr_bitonic_bsearch_index_target_that_do_not_exist_with_default
    nums = [1, 2, 3, 4, 5, 6, 7]
    target = 99
    result = nums.bitonic_bsearch_index(target, default: -1)

    assert_equal(-1, result)
  end

  def test_arr_bitonic_bsearch_index_target_return_leftest_index_of_target
    nums = [1, 2, 3, 4, 3, 2, 1]
    target = 1
    result = nums.bitonic_bsearch_index(target)

    assert_equal(0, result)
  end

  def test_arr_has_peak
    nums = [1, 2, 3, 4, 3, 2, 1]
    result = nums.has_peak?

    assert_equal(true, result)
  end

  def test_arr_has_no_peak
    nums = [1, 2, 3, 4, 5, 6, 7]
    result = nums.has_peak?

    assert_equal(false, result)
  end

  def test_another_arr_has_peak
    nums = [1, 2, 1]
    result = nums.has_peak?

    assert_equal(true, result)
  end

  def test_another_arr_has_no_peak
    nums = [1, 2, 3]
    result = nums.has_peak?

    assert_equal(false, result)
  end

  def test_arr_has_peak_index
    nums = [1, 2, 3, 4, 3, 2, 1]
    result = nums.peak_index

    assert_equal(3, result)
  end

  def test_arr_has_no_peak_index
    nums = [1, 2, 3, 4, 5, 6, 7]
    result = nums.peak_index

    assert_nil(result)
  end
end
