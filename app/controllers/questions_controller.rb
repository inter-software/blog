class QuestionsController < ApplicationController

  before_action :set_question, only: %i[show edit update destroy index new create]

  #GET   URI: /surveys/:survey_id/questions
  def index
    @questions = @survey.questions.all# List to all the questions to the survey (All Not)
  end

  def new
    @question = Question.new
  end

  # GET /surveys/:survey_id/questions/:id/edit
  def edit
  end

  def show
  end

  def create
    @question = Question.new(question_params)
    @question.survey_id = @survey.id
    respond_to do |format|
      if @question.save
        format.html {redirect_to survey_questions_path(@survey), notice: 'Question was successfully created'}
        format.json {render :show, status: :created}
      else
        format.html{render :new}
        format.json{render json: @question, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html {redirect_to  survey_questions_path(@survey), notice: 'Questions was Success' }
        format.json {render :show, location: @question, status: :ok}
      else
        format.html{render :edit}
        format.json{render json: @question, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html{redirect_to survey_questions_path(@survey), notice: 'Question was Success'}
      format.json {head :no_content }
    end
  end

  private

  def set_question
    @survey = Survey.find(params[:survey_id]) # Recuperate  the survey
    @question = Question.find(params[:id]) if params[:id]#Recuperate the question, only if send's
  end

  def question_params
    params.require(:question).permit(:question, :survey_id)
  end
end
