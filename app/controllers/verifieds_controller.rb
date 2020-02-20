# frozen_string_literal: true

# rubocop:todo Style/Documentation
class VerifiedsController < ApplicationController
  # Add Filters with Before_action
  before_action :set_verified, only: %i[show edit update]

  before_action :set_all_verified, only: [:index] # For Example

  def index; end

  def show; end

  def edit; end

  def new
    @verified = Verified.new
  end

  def create
    @verified = Verified.new(verified_params)

    if @verified.save
      flash[:msg] = 'It saved successfully'
      redirect_to @verified
    else
      flash[:msg] = "It dont't saved successfully"
      redirect_to :new
    end
  end

  def update
    if @verified.update(verified_params)
      redirect_to @verified
    else
      redirect_to :edit
    end
  end

  def destroy
    @verified = Verified.find(params[:id])
    @verified.destroy

    redirect_to verified_path
  end

  private

  def verified_params
    params.require(:verified).permit(:article_id, :user_id, :date, :comment)
  end

  def set_verified
    @verified = Verified.find(params[:id])
  end

  def set_all_verified
    @verifieds = Verified.all

    respond_to do |format|
      format.html # index.html-erb
      format.xml { render xml: @verifieds }
      format.json { render json: @verifieds }
    end
  end
end
# rubocop:enable Style/Documentation
