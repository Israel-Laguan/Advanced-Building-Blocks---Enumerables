# frozen_string_literal: true

module Enumerable
  def my_count(num = nil)
    count = 0
    if num
      my_each { |elem| count += 1 if elem == num }
    elsif block_given?
      my_each { |elem| count += 1 if yield(elem) }
    else
      count = length
    end
    count
  end
end
