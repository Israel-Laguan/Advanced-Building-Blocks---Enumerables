# frozen_string_literal: true

module Enumerable
  def my_inject(initial = nil)
    input = self.class == Range ? to_a : self
    result = initial.nil? || initial.is_a?(Symbol) ? input[0] : initial

    if block_given?
      input[initial.nil? ? 1 : 0..- 1].my_each do |i|
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
