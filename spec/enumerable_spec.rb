# frozen_string_literal: true

require_relative '../bin/main.rb'

RSpec.describe Enumerable do
  let(:test_arr) { [100, 54, 1, 2, 3, 4] }
  let(:test_arr2) { ['Billy', 'Wild Bill', 'Big Bill', 'Coffdrop'] }
  let(:test_arr3) { [12.2, 13.4, 15.5, 16.9, 10.2] }
  let(:array) { [1, 2, 3, 'dog', 'cow', :symbol, (1..10), { name: 'antonio', job: 'engineer' }] }
  let(:array_of_numbers) { [3, 5, 1, 8, 0, 3, 1, 1, 5, 6, 5, 0, 4, 0, 4, 3, 7, 4, 2, 2, 3, 1, 7, 8, 5, 8, 7, 7, 3, 4, 5, 2, 7, 2, 0, 6, 4, 0, 3, 2, 2, 3, 5, 7, 4, 3, 6, 3, 7, 3, 5, 6, 5, 3, 1, 8, 2, 5, 6, 7, 2, 6, 7, 5, 2, 7, 3, 0, 2, 6, 7, 2, 7, 5, 8, 3, 5, 1, 5, 2, 0, 8, 6, 1, 1, 6, 3, 3, 4, 5, 5, 7, 7, 7, 8, 5, 6, 2, 4, 8] }
  let(:array_of_strings) { %w[dog cat lion] }
  let(:array_of_mix_integers_and_strings) { array_of_numbers + array_of_strings }
  let(:array_of_nils) { [nil, nil, nil] }
  let(:array_with_one_nil) { [1, nil, 3] }
  let(:hash) { { name: 'israel', job: 'developer' } }
  let(:hash_of_strings) { { 'name' => 'israel', 'school' => 'YEP school', 'age' => '25' } }
  let(:range) { (1..10) }

  describe '#my_each' do
    context 'runs No block the same as #each' do
      it do
        expect(test_arr.my_each).to be_an(Enumerator)
      end
    end

    context 'runs a block the same as #each' do
      it do
        test = test_arr.each { |num| p num * 2 }
        expect(test_arr.my_each { |num| p num * 2 }).to eq(test)
      end
    end

    context 'runs a block the same as #each with array of strings' do
      it do
        test = test_arr2.each do |nickname, val|
          p "String: #{nickname}, Index: #{val}"
        end
        expect(test_arr2.my_each { |nickname, val| p "String: #{nickname}, Index: #{val}" }).to eq(test)
      end
    end
  end

  describe '#my_each_with_index' do
    context 'runs No block the same as #each_with_index' do
      it do
        expect(test_arr.my_each_with_index).to be_an(Enumerator)
      end
    end
    context 'is identical to #each_with_index' do
      it do
        test = test_arr.each_with_index { |num, i| p num + i }
        expect(test_arr.my_each_with_index { |num, i| p num + i }).to eq(test)
      end
    end
    context 'Runs in the correct order' do
      it do
        my_each_output = ''
        block = proc { |num, idx| my_each_output += "Num: #{num}, idx: #{idx}\n" }
        expect(array_of_numbers.my_each_with_index(&block)).to be_truthy
      end
    end
  end

  describe '#my_all' do
    context 'runs No block the same as #all' do
      it do
        expect(test_arr.my_all?).to eq(true)
      end
    end
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
    context 'is identical to #all with Strings 2' do
      it do
        test = test_arr2.all? { |name| name[0] == 'B' }
        expect(test_arr2.my_all? { |name| name[0] == 'B' }).to eq(test)
      end
    end
    context 'all the strings match' do
      it do
        expect(array_of_strings.my_all?(/\w+/)).to be_truthy
      end
    end
    context 'one or more strings don\'t match' do
      it 'should return false' do
        expect(array_of_strings.my_all?(/\d+/)).to be_falsy
      end
    end
    context 'none of the elements is a string' do
      it 'should return false' do
        expect(array_of_numbers.my_all?(/\w+/)).to be_falsy
      end
    end
    context
  end

  describe '#my_any' do
    context 'runs No block the same as #any' do
      it do
        expect(test_arr.my_any?).to eq(true)
      end
    end
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

    context 'is identical to #any with Strings 2' do
      it do
        test = test_arr2.any? { |name| name.match(/Bi/) }
        expect(test_arr2.my_any? { |name| name.match(/Bi/) }).to eq(test)
      end
    end

    context 'is identical to #any using String parameter' do
      it do
        expect(test_arr2.my_any?('Billy')).to eq(true)
      end
    end
  end

  describe '#my_count' do
    context 'runs No block the same as #count' do
      it do
        expect(test_arr.my_count).to eq(6)
      end
    end
    context 'is identical to #count using parameter' do
      it do
        expect(test_arr.my_count(1)).to eq(1)
      end
    end
    context 'is identical to #count using no parameter' do
      it do
        expect(test_arr.my_count).to eq(6)
      end
    end
    context 'is identical to #count using block' do
      it do
        expect(test_arr.my_count { |num| num < 4 }).to eq(3)
      end
    end
  end

  describe '#none' do
    context 'runs No block the same as #none' do
      it do
        expect(test_arr.my_none?).to eq(false)
      end
    end
    context 'is identical to #none with Integers' do
      it do
        test = test_arr.none? { |num| num.is_a? Integer }
        expect(test_arr.my_none? { |num| num.is_a? Integer }).to eq(test)
      end
    end

    context 'is identical to #none with Strings' do
      it do
        test = test_arr.none? { |num| num.is_a? String }
        expect(test_arr.my_none? { |num| num.is_a? String }).to eq(test)
      end
    end

    context 'is identical to #none with Strings 2' do
      it do
        test = test_arr2.none? { |name| name.match(/zzz/) }
        expect(test_arr2.my_none? { |name| name.match(/zzz/) }).to eq(test)
      end
    end

    context 'is identical to #none using Integer parameter' do
      it do
        expect(test_arr.my_none?(3)).to eq(false)
      end
    end

    context 'is identical to #count using String parameter' do
      it do
        expect(test_arr2.my_none?('Billy')).to eq(false)
      end
    end
  end

  describe '#select' do
    context 'runs No block the same as #select' do
      it do
        expect(test_arr.my_select).to be_an(Enumerator)
      end
    end
    context 'is identical to #select' do
      it do
        test = test_arr.select(&:even?)
        expect(test_arr.my_select(&:even?)).to eq(test)
      end
    end

    context 'is identical to #select 2' do
      it do
        test = test_arr3.select do |num|
          num.to_f > 13.3
        end
        expect(test_arr3.my_select { |num| num.to_f > 13.3 }).to eq(test)
      end
    end
  end

  describe '#map' do
    context 'runs No block the same as #map' do
      it do
        expect(test_arr.my_map).to be_an(Enumerator)
      end
    end
    context 'is identical to #map' do
      it do
        test = test_arr.map { |num| num * 10 }
        expect(test_arr.my_map { |num| num * 10 }).to eq(test)
      end
    end

    context 'takes either a proc or a block' do
      it do
        test_block = proc { |elem| elem * 10 }
        test = test_arr.map(&test_block)
        expect(test_arr.my_map(&test_block)).to eq(test)
      end
    end
  end

  describe '#inject' do
    context 'is identical to #inject' do
      it do
        test = test_arr.inject { |result, elem| result + elem }
        expect(test_arr.my_inject { |result, elem| result + elem }).to eq(test)
      end
    end
  end
end
