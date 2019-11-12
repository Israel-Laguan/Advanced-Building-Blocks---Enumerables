# frozen_string_literal: true

module Enumerable
  def my_none?(pattern = nil, &a_block)
    !my_any?(pattern, &a_block)
  end
end
