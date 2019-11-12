# frozen_string_literal: true

module Enumerable
  def my_all?(arg = nil)
    if block_given?
      my_each { |element| return false unless yield(element) }
    end
    if arg.nil?
      my_each { |element| return false unless element }
      return true
    end

    my_each { |i| return false unless check_valid(i, arg) }
    true
  end
end
