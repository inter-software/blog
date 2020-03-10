class SurveysController < ApplicationController

  #before_action :set_survey, only: %i[show ]

  before_action :authenticate_user!

  before_action :set_all_surveys, only:  :index

  before_action :set_survey, only: %i[ show edit update destroy partial_show]

  def index; end

  def new
    @survey = Survey.new
    @survey.questions.new
  end

  # surveys#edit
  # edit_surveys GET /surveys/edit
  def edit
  end

  def show

  end

  def create
    @survey = Survey.new(survey_params)
    @survey.questions.first
    respond_to do |format|
      if @survey.save
        flash[:msg] = 'It saved successfully'
        format.html { redirect_to @survey }
        format.xml {render xml: @survey }
        format.json {render json: @survey }
      else
        flash[:msg] = "It dont't saved successfully"
        render :new
      end
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
    @survey.destroy
    redirect_to survey_path(@survey)
  end

  private

      def set_all_surveys
        @surveys = Survey.all
      end

      def set_survey
        @survey = Survey.find(params[:id])
      end

      def survey_params
        params.require(:survey).permit(:survey_name, :survey_desc,
                                       questions_attributes: [:id, :question, :_destroy])
      end
end
