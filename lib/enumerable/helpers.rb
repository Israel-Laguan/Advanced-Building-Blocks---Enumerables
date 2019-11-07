# frozen_string_literal: true

module Enumerable
  def check_valid(input, parameter)
    if parameter.is_a? Regexp
      !input.to_s.match(parameter).nil?
    elsif parameter.is_a? Class
      (input.class == parameter)
    else
      (input == parameter)
    end
  end

  def multiply_els(arr)
    arr.my_inject { |memo, val| memo * val }
  end
end
