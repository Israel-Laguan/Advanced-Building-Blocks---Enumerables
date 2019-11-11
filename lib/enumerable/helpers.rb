# frozen_string_literal: true

module Enumerable
  def check_valid(input, parameter)
    return input.is_a?(parameter) if parameter.is_a? Class

    if parameter.is_a? Regexp
      return false if input.is_a?(Numeric)

      return parameter.match(input)
    end
    (input == parameter)
  end

  def verify_input(initial)
    start = initial.nil? ? 1 : 0
    start
  end

  def multiply_els(arr, multiplier)
    arr.my_inject(multiplier) { |memo, val| memo * val }
  end
end
