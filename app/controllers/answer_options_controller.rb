class AnswerOptionsController < ApplicationController

  before_action  :set_answer_option, only: %i[show index new update destroy create]

  def index
    @answer_options = @question.answer_options.all
  end

  def new
    @answer_option = AnswerOption.new
  end

  def show
  end

  # GET    /surveys/:survey_id/questions/:question_id/answer_options/:id/edit(.:format)
  def edit
    @question = Question.find(params[:id])
    @answer_option = @question.questions.find(params[:id])
  end

  def create
    @answer_option = AnswerOption.new(answer_option_params)
    @answer_option.question_id = @question.id
    respond_to do |format|
      if @answer_option.save
        format.html {redirect_to survey_question_answer_options_path(@question), notice: 'Answer Option was successfully created'}
        format.json {render :show, status: :created}
      else
        format.html{render :new}
        format.json{render json: @answer_option, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @answer_option.destroy
    respond_to do |format|
      format.html{redirect_to survey_question_answer_options_url(@question), notice: 'Question was Success'}
      format.json {head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @answer_option.update(answer_option_params)
        format.html{redirect_to survey_question_answer_options_path(@question), notice: 'Engineer was successfully'}
        format.json{render json: @answer_option}
      else
        format.html{redirect_to :edit}
      end
    end
  end

  private

  def set_answer_option
    #/surveys/:survey_id/questions/:question_id/answer_options/:id/edit(.:format)
    @survey = Survey.find(params[:id]) #recupere the survey
    @question = Question.find(params[:question_id]) # Recuperate  the question
    @answer_option = AnswerOption.find(params[:id]) if params[:id]#Recuperate the question, only if send's
  end

  def answer_option_params
    params.require(:answer_option).permit(:text, :question_id)
  end

end
