# frozen_string_literal: true

module Enumerable
  def my_inject(initial = nil, operation = nil)
    return multiply_els(self, initial) if operation == :*

    verified = verify_input(initial)

    input = self.class == Range ? to_a : self
    result = initial.nil? || initial.is_a?(Symbol) ? 0 : initial
    if block_given?
      start = verified[1]
      input[start..- 1].my_each do |i|
        result = yield(result, i)
      end
    else
      input[1..-1].my_each do |i|
        result = result.send(initial, i)
      end
    end
    result
  end
end
