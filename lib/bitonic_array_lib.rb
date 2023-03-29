# frozen_string_literal: true

# Bitonic array definition:
# An array where it increase monotically.
# From a point onward, it might start to
# decrease monotically.
module BitonicArrayLib
  def bitonic_max
    return self[peak_index] if has_peak?

    self[-1]
  end

  def bitonic_bsearch(target, **options)
    default = options[:default]
    index = bitonic_bsearch_index(target, **options)
    index ? self[index] : default
  end

  def bitonic_bsearch_index(target, **options)
    default = options[:default]

    return bsearch_index { |num| target <=> num } || default unless mid_point = peak_index

    index = (0..mid_point).bsearch { |i| target <=> self[i] }

    return index if index

    # mirror the bsearch since it is decreasing at the right part
    index = (mid_point + 1...length - 1).bsearch { |i| -(target <=> self[i]) }
    index || default
  end

  def peak?
    !!peak_index
  end

  alias has_peak? peak?

  def peak_index
    left = 0
    right = length - 1

    while left < right
      mid = (left + right) / 2

      self[mid] > self[mid + 1] ? right = mid : left = mid + 1
    end
    left != length - 1 ? left : nil
  end
end
