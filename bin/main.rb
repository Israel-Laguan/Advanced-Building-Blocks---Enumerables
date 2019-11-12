#!/usr/bin/ruby
# frozen_string_literal: true

require_relative '../lib/enumerable.rb'

operation = proc { |sum, n| sum + n }
array = [5, 1, 7, 2, 3, 6, 3, 3, 1, 6, 1, 2, 5, 8, 3, 7, 2, 6, 5, 7, 5, 4, 3, 6, 4, 0, 8, 6, 3, 8, 0, 3, 7, 1, 0, 4, 0, 8, 8, 6, 1, 3, 0, 7, 0, 5, 1, 0, 2, 2, 8, 1, 3, 3, 1, 6, 0, 2, 8, 2, 8, 7, 3, 7, 3, 3, 0, 8, 6, 5, 5, 1, 6, 0, 3, 4, 1, 1, 7, 1, 5, 8, 5, 0, 7, 5, 0, 6, 4, 0, 3, 1, 6, 7, 6, 6, 7, 7, 4, 7]
p array.my_inject(&operation)