class SurveysController < ApplicationController

  #before_action :set_survey, only: %i[show ]

  before_action :set_all_surveys, only:  :index

  def index; end

  def new
    @survey = Survey.new
  end

  # surveys#edit
  # edit_surveys GET /surveys/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  def show; end

  def create
    @survey = Survey.new(survey_params)

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
    @survey = Survey.find(params[:id])

    if @survey.update(survey_params)
      redirect_to @survey
    else
      redirect_to :edit
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_index_path(@survey)
  end

  private

      def set_all_surveys
        @surveys = Survey.all
      end

      def set_survey
        @survey = Survey.find(params[:id])
      end

      def survey_params
        params.require(:survey).permit(:survey_name, :survey_desc)
      end
end