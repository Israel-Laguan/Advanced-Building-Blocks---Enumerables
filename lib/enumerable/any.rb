# frozen_string_literal: true

module Enumerable
  def my_any?
    raise 'Please provide a block' unless block_given?

    result = false
    my_each { |elem| result = true if yield(elem) }
    result
  end
end
