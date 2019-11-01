# frozen_string_literal: true

module Enumerable
  def my_any?(arg = nil)
    if block_given?
      my_each { |i| return true if yield(i) }
    elsif arg.nil?
      my_each { |i| return true if i }
    else
      my_each { |i| return true if i.is_a?(arg) }
    end
    false
  end
end
