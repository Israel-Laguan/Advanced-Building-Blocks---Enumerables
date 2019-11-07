# frozen_string_literal: true

module Enumerable
  def my_each_with_index
    return to_enum unless block_given?

    input = is_a?(Range) ? to_a : self
    my_each { |index| yield(input[index], index) }
    input
  end
end
