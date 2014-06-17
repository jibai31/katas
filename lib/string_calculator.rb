class StringCalculator

  def add(input)
    return 0 if input.blank?
    raise_exception_if_negatives_found(input)

    delimiter = extract_delimiter(input)
    numbers = input.split /[,\n#{delimiter unless delimiter.blank?}]/
    if numbers.size==1
      numbers[0].to_i
    else
      numbers.sum{|n| n.to_i}
      #numbers.inject(0){|sum,n| sum + n.to_i}
    end
  end

  def extract_delimiter(input)
    if input =~ /^\/\/(.)*\n/
      $1
    end
  end

  def raise_exception_if_negatives_found(input)
    match = input.scan /(-\d)/
    if match.any?
      raise ArgumentError, "Negatives not allowed: #{match.join(', ')}"
    end
  end
end
