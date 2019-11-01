# frozen_string_literal: true

module Enumerable
  def my_each
    return to_enum unless block_given?

    index = 0
    while index < length
      yield(self[index])
      index += 1
    end
    self
  end
end
