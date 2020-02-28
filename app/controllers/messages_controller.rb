class MessagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :create]

  def index
    @messages = Message.all

    respond_to do |format|
      format.html
      format.xml{render xml: @messages}
      format.json {render json: @messages}  #It's rendering the messages data in format  type JSON
    end
  end

  def create
    message = Message.new(text: params[:message])

    if message.save
      flash[:notice] = "The message was saved successfully"
      redirect_to action:  "new"
    else
      redirect_to action: "index"
    end
  end
end
