# frozen_string_literal: true

module Enumerable
  def my_all?
    verified = false
    my_each { |elem| verified = yield(elem) }
    verified
  end

end
