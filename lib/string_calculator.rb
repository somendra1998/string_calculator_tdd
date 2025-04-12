class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = /,|\n/

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)

      if header.match?(/\A\/\/\[(.+)\]\z/)
        custom_delimiter = header.match(/\A\/\/\[(.+)\]\z/)[1]
      else
        custom_delimiter = header[2]
      end

      delimiter = /#{Regexp.escape(custom_delimiter)}|,|\n/
    end

    number_list = numbers.split(delimiter).map(&:to_i)

    negatives = number_list.select { |n| n < 0 }
    unless negatives.empty?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end

    number_list.reject { |n| n > 1000 }.sum
  end
end
