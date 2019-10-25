# frozen_string_literal: true

require_relative '../lib/enumerable.rb'

test_arr = [100, 54, 1, 2, 3, 4]

RSpec.describe Enumerable do
  describe '#my_each' do
    context 'runs a block the same as #each' do
      it do
        test = test_arr.each { |num| puts num * 2 }
        expect(test_arr.my_each { |num| puts num * 2 }).to eq(test)
      end
    end
  end

  describe '#my_each_with_index' do
    context 'is identical to #each_with_index' do
      it do
        test = test_arr.each_with_index { |num, i| puts num + i }
        expect(test_arr.my_each_with_index { |num, i| puts num + i }).to eq(test)
      end
    end
  end

  describe '#my_all' do
    context 'is identical to #all with Integers' do
      it do
        test = test_arr.all? { |num| num.is_a? Integer }
        expect(test_arr.my_all? { |num| num.is_a? Integer }).to eq(test)
      end
    end
    context 'is identical to #all with Strings' do
      it do
        test = test_arr.all? { |num| num.is_a? String }
        expect(test_arr.my_all? { |num| num.is_a? String }).to eq(test)
      end
    end
  end
  describe '#my_any' do
    context 'is identical to #any with Integers' do
      it do
        test = test_arr.any? { |num| num.is_a? Integer }
        expect(test_arr.my_any? { |num| num.is_a? Integer }).to eq(test)
      end
    end
    context 'is identical to #any with Strings' do
      it do
        test = test_arr.any? { |num| num.is_a? String }
        expect(test_arr.my_any? { |num| num.is_a? String }).to eq(test)
      end
    end
  end
  describe '#my_count' do
    context 'is identical to #count using parameter' do
      it do
        expect(test_arr.count(5)).to eq(0)
      end
    end
  end
end
