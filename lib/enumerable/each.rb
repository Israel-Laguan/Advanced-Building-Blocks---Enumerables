# frozen_string_literal: true

module Enumerable
  def my_each
    return to_enum unless block_given?

    input = is_a?(Range) ? to_a : self
    index = 0
    while index < size
      yield(input[index])
      index += 1
    end
    input
  end
end
