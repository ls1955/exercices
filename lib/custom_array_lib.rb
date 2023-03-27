# frozen_string_literal: true

module CustomArrayLib
  # Return nearest element index that is smaller or
  # equals to the target, nil if it does not exist.
  def lbsearch_index(target)
    left = 0
    right = length - 1

    while left < right
      mid = (right + left) / 2 + 1

      self[mid] <= target ? left = mid : right = mid - 1
    end
    self[left] <= target ? left : nil
  end

  # Similar to #lbsearch_index, return element instead.
  def lbsearch(target)
    index = lbsearch_index(target)
    index ? self[index] : nil
  end

  # Return nearest element index that is greater than
  # target, nil if it does ont exist
  def rbsearch_index(target)
    left = 0
    right = length - 1

    while left < right
      mid = (left + right) / 2

      self[mid] <= target ? left = mid + 1 : right = mid
    end

    # check if left pointer go out of bound
    return nil if left == length

    self[left] > target ? left : nil
  end

  # Similar to #rbsearch_index, return element instead.
  def rbsearch(target)
    index = rbsearch_index(target)
    index ? self[index] : nil
  end
end
