class AnswersController < ApplicationController

  before_action :set_question, only: %i[show edit update]

  def index
    @answers = Answer.all

    respond_to do |format|
      format.html
      format.json {render json: @answers }
    end
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def show
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      flash[:msg] = 'It saved successfully'
      redirect_to @answer
    else
      flash[:msg] = "It dont't saved successfully"
      redirect_to :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      redirect_to :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])

    @answer.destroy
    redirect_to answer_path
  end

  private

  def set_answer
    @answers = Answer.find(params[:id])
  end

  def answer_params

  end
end
