class CommentsController < ApplicationController

        #http_basic_authenticate_with name: "admin", password: "123", 
        #    only: [:destroy]

        def show 

        end

        def create
            # al articulo con id = ?, fue encontrado, pasamos una variable de instancia,
            # refencia la variable de instancia  @article con el articulo encontrado, 
            # crea un evento en comments, con el metodo create, le pasamos un serie de parametros.
            @article = Article.find(params[:article_id])
            @comment = @article.comments.create(comment_params)
            redirect_to article_path(@article)
        end
         
        def destroy
            @article = Article.find(params[:article_id])
            @comment = @article.comments.find(params[:id])
            @comment.destroy
            
            redirect_to article_path(@article)
        end
         
        private
            def comment_params
              params.require(:comment).permit(:commenter, :body)
            end

end
