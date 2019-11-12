# frozen_string_literal: true

module Enumerable
  def my_select
    return to_enum unless block_given?

    new_arr = []
    my_each { |elem| new_arr << elem if yield(elem) }
    new_arr
  end
end
