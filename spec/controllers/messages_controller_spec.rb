require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe 'POST#Create' do

    let(:message) { Message.create(text: "a quick brown fox") }

    it 'creates a new messages' do
      post :create, params: {message: "a quick brown"}
      expect(message).to be_valid
    end

    it 'Save the Messages' do
      post :create
    end

    it 'Redirects to the Messages Index' do
      post :create
      expect(response).to redirect_to(action: "index")
    end

    context "When Rendering to the template in format JSON and XML" do
      it 'Rendering to the template index in format JSON' do
        get :index, format: :json
        # return data type JSON in chaset=UTF-8, where equal to type content to response.
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

      it "Rendering to the Index Template the data in format xml " do
        get :index, format: :xml
        expect(response.content_type).to eq("application/xml; charset=utf-8")
      end
    end

    context "When the message saves successfully" do
      it "sets a flash[:notice] message" do
        post :create, params: {message: "a quick browm"} # Request type CREATE
        expect(flash[:notice]).to eq("The message was saved successfully") #Old Syntaxis in flash[:notice].should
      end

      it "redirects to the Messages index" do
        post :create
        expect(response).to redirect_to(action: :index) # Old response.should redirect_to(:action => "index")
      end

      it "assigns @message" do
        message = Message.create
        message.save
        post :create
      end

      it "renders the new template" do
        post :create

      end
    end
  end

end
