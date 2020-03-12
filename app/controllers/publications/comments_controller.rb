class Publications::CommentsController < CommentsController

  before_action :set_commentable

  private

  def set_commentable
    @commentable = Publication.find(params[:publication_id])
  end

end
