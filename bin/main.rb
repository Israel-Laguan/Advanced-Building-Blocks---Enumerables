#!/usr/bin/ruby
# frozen_string_literal: true

require_relative '../lib/enumerable.rb'


p (5..10).my_inject { |sum, n| sum + n } 
p (5..10).my_inject(1) { |product, n| product * n }