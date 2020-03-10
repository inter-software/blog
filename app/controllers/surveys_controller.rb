class SurveysController < ApplicationController

  #before_action :set_survey, only: %i[show ]

  before_action :authenticate_user!

  before_action :set_all_surveys, only:  :index

  before_action :set_survey, only: %i[ show edit update destroy]

  def index; end

  def new
    @survey = Survey.new
    @survey.questions.build
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
    respond_to do |format|
      if @survey.update(survey_params)
        format.html{redirect_to survey_path(@survey), notice: 'Update was survey Successfully'}
        format.json{render json: @survey}
      else
        format.html{render :edit}
      end
    end
  end

  def destroy
    @survey.destroy
    respond_to do |format|
      format.html{redirect_to survey_url, notice: 'Destroy was survey successfully'}
      format.json{render json: @survey}
    end
  end

  private

      def set_all_surveys
        @surveys = Survey.order('created_at ASC').all
      end

      def set_survey
        @survey = Survey.find(params[:id])
      end

      def survey_params
        params.require(:survey).permit(:survey_name, :survey_desc,
                                       questions_attributes:[:id, :question, :_destroy])
      end
end
