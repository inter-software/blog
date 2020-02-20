# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  # It's method before(:context) invoked before the transaction is open.
  # For example, use in speed by created data once before in group excute el block.
  # before(:context) do
  #   @comment = Comment.create #create to instance of the object Comment, call to create method
  # end

  # after(:context) do
  #  @comment = Comment.destroy
  # end

  # before(:example_load) do
  #  @comment.reload
  # end

  #
  #       the instance variable @comment that recreated in the two examples,
  #       so has different object. It's for each example define a new object-

  # define a if implicite, execute block (true)
  # it 'Does Something' do
  #  #It's that equals with the instance variable, call do_something method
  #  expect(@comment).to do_something
  # end

  # Declare un if with acction in else (False)
  # it 'Does Something else' do
  #  expect(@comment).to do_something_else
  # end

  #
  #
  #
  #   Note: Even though database updates in each example will be rolled back, the
  #   object won't know about those rollbacks so the object and its backing
  #   data can easily get out of sync.
  #

  context 'With two or more comments' do
    it 'Orders them in reverse chronologically' do
      # declare the varible comment and assing in the object Comment invokend create method.
      comment = Comment.create!
      # created two objects, validation it created.
      comment1 = comment.comments.create!(commenter: 'Pepe', body: 'First Comment')
      comment2 = comment.comments.create!(commenter: 'Pepa', body: 'Second Comment')
      # Declare method expect that have a if (Implicite),
      # It's get with parameter la instance the objet Comment and reload the comments method.
      expect(comment.reload.comments).to eq([comment2, comment1])
    end
  end
end
