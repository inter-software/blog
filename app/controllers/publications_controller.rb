class PublicationsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_publication, only: %i[show edit update destroy]

  def index
    @publications = Publication.order('created_at DESC').all
  end

  def show
  end

  def edit
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)

    respond_to do |format|
      if @publication.save
        format.html{redirect_to publications_path(@publication), notice: 'Publication was the created successfully'}
        format.json{render :show}
      else
        format.html{render :new}
        format.json{render json: @publication}
      end
    end
  end

  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html{redirect_to publication_path(@publication), notice: 'Publication was the created successfully'}
        format.json{render :show}
      else
        format.html{render :edit}
        format.json{render json: @publication}
      end
    end
  end

  def destroy
    @publication.destroy
    respond_to do |format|
      format.html{redirect_to publications_path}
    end
  end

  private

  def set_publication
    @publication = Publication.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:name, :desc)
  end

end
