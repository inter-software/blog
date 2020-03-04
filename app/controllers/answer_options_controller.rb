class AnswerOptionsController < ApplicationController

  before_action :set_answer_option, only: %i[edit update destroy]

  def index
    @answer_options = AnswerOption.all
  end

  def new
    @answer_option = AnswerOption.new
  end

  def edit
  end

  def create
    @answer_option = AnswerOption.new(answerOption_params)

    if @answer_option.save
      flash[:msg] = 'It saved successfully'
      redirect_to @answer_option
    else
      flash[:msg] = "It dont't saved successfully"
      redirect_to :new
    end
  end

  def destroy
    @answer_option.destroy
    redirect_to answer_option_path
  end

  def update
    if @answer_option.update(answerOption_params)
      redirect_to @answer_option
    else
      redirect_to :edit
    end
  end

  private

  def answerOption_params
    params.require(:answer_option).permit(:text, :question_id)
  end

  def set_answer_option
    @answer_option = AnswerOption.find(params[:id])
  end
end
