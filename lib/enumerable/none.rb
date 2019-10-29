# frozen_string_literal: true

module Enumerable
  def my_none?
    raise 'Please provide a block' unless block_given?

    result = true
    my_each { |elem| result = false if yield(elem) }
    result
  end
end
