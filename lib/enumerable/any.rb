# frozen_string_literal: true

module Enumerable
  def my_any?(arg = nil, &proc)
    if block_given?
      my_each { |element| return true if proc.nil? ? proc.call(element) : yield(element) }
    else
      my_each { |i| return true if arg.nil? ? i : check_valid(i, arg) }
    end
    false
  end
end
