class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "123",
  #    only: [:destroy]

  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.save
    redirect_to @commentable, notice: 'You Comment Was Successfully created'
  end

  private

    def comment_params
      params.require(:comment).permit(:commenter, :body, :article_id)
    end

end

