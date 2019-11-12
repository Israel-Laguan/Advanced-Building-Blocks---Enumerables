# frozen_string_literal: true

module Enumerable
  def my_inject(arg_1 = nil, arg_2 = nil)
    (inject, sym, array) = get_inject_and_sym(arg_1, arg_2, to_a.dup, block_given?)
    array.my_each { |i| inject = sym ? inject.send(sym, i) : yield(inject, i) }
    inject
  end

  def get_inject_and_sym(arg1, arg2, arr, block)
    arg1 = arr.shift if arg1.nil? && block
    return [arg1, nil, arr] if block
    return [arr.shift, arg1, arr] if arg2.nil?

    [arg1, arg2, arr]
  end
end
