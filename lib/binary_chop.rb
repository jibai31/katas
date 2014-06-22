class BinaryChop

  def chop(int, array)
    return -1 if array.empty?
    array.each_with_index do |i, index|
      return index if i==int
    end
    return -1
  end

end
