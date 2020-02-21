# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe  "Some Examples Article Model" do
    it 'Return the Comment Report ' do
      comment = Comment.new(commenter: "Pepe", body: "Great!, Wonderfull")
      info = comment.report_comment # "My Comments: Pepe, Great!, Wonderfull"
      expect(info).to eq("My Comments: Pepe, Great!, Wonderfull") # eq es un matcher de rspec
    end

  end

  describe  'Common, built-in expectation matchers' do

    example "Equality" do
      expect('x'+'y').to eq('xy') # x == y
      expect('x'+'y').to eql('xy') # x.eql?(y)
      expect('x'+'y').not_to be('xy') # x.equal?(y)
    end

    example "Strings" do
      expect('abcd').to include('bc')
      expect('abcd').to start_with 'ab'
      expect('abcd').to end_with 'cd'
      expect('abcd').to match /[a-z]+/
    end

    example "Collections" do
      expect([1, 2, 3, 4, 5, 6]).to include(3,5)
      expect([1, 3, 5, 7, 9, 11]).to contain_exactly(11, 9, 7, 5, 3, 1)
      expect({name: "Juan", age: 2020-1950}).to include(age: 70)
    end

    example "Booleans and Nils" do
      expect(true).to be(true)
      expect(false).to be(false)
      expect('abc').to be_truthy
      expect(nil).to be_falsey
      expect(nil).to be_nil
    end

    example "Numeric" do
      expect(5).to be > 4
      expect(5).to be >= 4
      expect(5).to be < 6
      expect(5).to be <= 6
      expect(5).to be_between(4, 6).exclusive
      expect(5).to be_between(5, 6).inclusive
      expect(4.99).to be_within(0.02).of(5)
    end

    #example "Errors (Exceptions)" do
    #  expect{5 / 0}.to raise_error(ZeroDivisionError)
    #  expect{5 / 0}.to raise_error("Divided by 0")
    #  expect{5 / 0}.to raise_error(ZeroDivisionError, "Divided by 0")
    #end
  end

  describe "Predicate Matchers" do

    example "Arrays" do
      expect([]).to be_empty   #  [].empty? : It's empty
    end

    example "Hash" do
      expect({a: 4}).to have_key(:a) #  {a:4}.hash_key? : It's key
      expect({a: 4}).to have_value(4) #  {a:4}.hash_value? : It's value
    end

    example "Objects" do
      expect(5).not_to be_nil # 5.nil? : The Object (5)  is nil
      expect(5).to be_instance_of Fixnum # 5.instance_of?(Fixnum)
      expect(5).to be_kind_of Numeric # 5.kind_of?
    end

    #it "Custom with Article Class" do

    # comment = Comment.new(commenter: "Charly", body: "Great")
    #  infos = comment.search_comment
    # expect(infos).to eq('charly')

    #end

    example "Rarely used matcherns" do
      expect(6).to respond_to(:odd?)
      expect(Pathname.new('.')).to exist # pathname.exist? si es existe la ruta.
      expect(1..10).to cover(7)
    end


  end

end
