# frozen_string_literal: true

module Enumerable
  def my_all?
    raise 'Please provide a block' unless block_given?

    result = false
    my_each { |elem| result = yield(elem) ? true : false }
    result
  end
end
