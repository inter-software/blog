class SurveysController < ApplicationController
  before_action :set_survey, only: %i[show edit update]

  def index
    @surveys = Survey.all

    respond_to do |format|
      format.html
      format.json {render json: @surveys }
    end
  end

  def new
    @survey = Question.new
  end

  def edit
  end

  def show
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      flash[:msg] = 'It saved successfully'
      redirect_to @survey
    else
      flash[:msg] = "It dont't saved successfully"
      redirect_to :new
    end
  end

  def update
    if @survey.update(survey_params)
      redirect_to @survey
    else
      redirect_to :edit
    end
  end

  def destroy
    @survey = Survey.find(params[:id])

    @survey.destroy
    redirect_to survey_path
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:answer_id, :survey_name, :survey_desc)
  end
end
