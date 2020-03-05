class Comments::PublicationsController < ApplicationController

  def new
    @publication = @published.publications.new
  end

  def create
    @publication = @published.publications.new(publication_params)
    @published.save
    redirect_to @published, notice: "You Publications was successfully posted"
  end

  private

  def publication_params
    params.require(:publication).permit(:published_type)
  end
end
