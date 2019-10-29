# frozen_string_literal: true

module Enumerable
  def my_map(block = nil)
    raise 'Please provide a block' unless block_given?

    array = []
    if block
      my_each_with_index { |elem, index| array[index] = block.call(elem) }
    else
      my_each_with_index { |elem, index| array[index] = yield(elem) }
    end
    array
  end
end
