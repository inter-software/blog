require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe 'POST#Create' do
    it 'creates a new messages' do
      Message.should_receive(:new).with("text" => "a quick brown fox")
      post :create, :message => { "text" => "a quick brown fox" }
    end

    it 'Save the Messages'
  end

end
