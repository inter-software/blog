class Articles::PublicationsController < ApplicationController

  before_action :set_publication

  def create
    super
    #@published.save
    #redirect_to @published, notice: "You Publications was successfully posted"
  end

  private

  def set_publication
    @published = Article.find(params[:id])
  end


end