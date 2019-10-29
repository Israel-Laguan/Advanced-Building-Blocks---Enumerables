# frozen_string_literal: true

module Enumerable
  def my_each_with_index
    raise 'Please provide a block' unless block_given?

    index = 0
    while index < length
      yield(self[index], index)
      index += 1
    end
    self
  end
end
