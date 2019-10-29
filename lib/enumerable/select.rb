# frozen_string_literal: true

module Enumerable
  def my_select
    raise 'Please provide a block' unless block_given?

    new_arr = []
    my_each { |elem| new_arr << elem if yield(elem) }
    new_arr
  end
end
