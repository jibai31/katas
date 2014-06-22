class BinaryChopRecursive

  def chop(int, array, base_index=0)
    size = array.count
    return -1 if size == 0
    return array.first==int ? base_index : -1 if size == 1

    middle = size/2
    middle_element = array[middle]

    if middle_element == int
      base_index + middle
    elsif middle_element > int
      first_half = array[0..middle-1]
      chop(int, first_half)
    else
      second_half = array[middle+1..array.count-1]
      starting_index = middle + 1
      chop(int, second_half, starting_index)
    end
  end

end
