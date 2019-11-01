# frozen_string_literal: true

module Enumerable
  def my_inject(initial = nil)
    return to_enum unless block_given?

    result = initial.nil? ? self[0] : initial

    [*1..length - 1].my_each do |i|
      result = yield(result, self[i])
    end
    result
  end
end
