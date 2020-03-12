class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "123",
  #    only: [:destroy]

  before_action :set_comment, only: %i[edit update]

  def index
    @comments = Comment.all
  end

  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    redirect_to :show
  end

  def edit
  end

  def new
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id]) # Recupera el articulo
    @comment = @article.comments.create(comment_params) # le asinga ala instancia del objeto comment los parametros son enviados por post
    redirect_to article_path(@article)# /articles/:article_id/comments
  end


  def destroy
    @article = Article.find(params[:article_id]) # get the ID the Article
    @comment = @article.comments.find(params[:id]) # Get the id the comments in article.
    @comment.destroy # The instance the comments, Call to the destroy method

    redirect_to article_path(@article)
  end

  private

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end

