# frozen_string_literal: true

module Enumerable
  def my_each
    raise 'Please provide a block' unless block_given?

    index = 0
    while index < length
      yield(self[index])
      index += 1
    end
    self
  end
end
