require 'rails_helper'

RSpec.describe Message, type: :model do

  describe "Some Samples" do

    let(:message){Message.new}

    it 'Is Valid with a text name' do

      message = Message.new(text: "Hi, Wonderfull!!")

      expect(message).to be_valid

    end

    it 'Is Invalid without a text name' do
      message = Message.new(text: nil)
      message.valid?
      expect(message.errors[:text]).to  include("can't be blank")
    end

    it 'returns a messages full name as a string' do
      msg = Message.new
      expect(msg.message('Hi', 'Pepe')).to eq "Hi, Pepe"
    end
  end


end
