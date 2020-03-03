class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update]

  def index
    @questions = Question.all

    respond_to do |format|
      format.html
      format.json {render json: @questions }
    end
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def show
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:msg] = 'It saved successfully'
      redirect_to @question
    else
      flash[:msg] = "It dont't saved successfully"
      redirect_to :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      redirect_to :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])

    @question.destroy
    redirect_to question_path
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:user_id, :question)
  end
end
