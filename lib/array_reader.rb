# frozen_string_literal: true

# A class that hide away the array underneath.
# Able to get element for certain index only.
class ArrayReader
  attr_reader :arr

  def initialize(arr)
    @arr = arr
  end

  def get(index)
    return Float::INFINITY if index >= arr.length

    arr[index]
  end

  alias [] get
end
