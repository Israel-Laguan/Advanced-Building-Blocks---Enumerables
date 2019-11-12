# frozen_string_literal: true

def multiply_els(arr)
  arr.my_inject(1) { |memo, val| memo * val }
end
