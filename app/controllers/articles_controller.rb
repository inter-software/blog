class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show, :edit, :update]

    #http_basic_authenticate_with name: "admin", password: "123", 
    #except: [:index, :show] 
 

    def index  
        #params[:category] ? @articles = Article.category_with(params[:category]) : 
        @articles = Article.search(params[:search], params[:page])
        @articles = Article.all
        @articles = Article.paginate(page: params[:page])
    end
   
    def show
    end

    #obtenemos el id de modelo de articulo en BD, id = 7
    def edit
    end

   

    def new
        @article = Article.new
    end

    def create
        #render plain: params[:article].inspect
        # utilizamos un variable instancia para instancia un nuevo objeto del Modelo Articulo, 
        # y recibe como parametro, en el metodo params,
        # guardar en un array los parametros o campos, del recurso articulos.     
        @article = Article.new(article_params)
        

        # Guardar el Modelo y lo guarda en BD, 
        # Retorna un Valor Booleano (True ó False), si se guardo correctamente o no.
        #@article.save , es validamos si modelo se guardo correctamente, con una condicion

        if @article.save
            # Renderiza el articulo, alamcena la variable de instancia. 
            # Redericiona ala accion show,
            redirect_to @article
            
        else
            # render, instancia de redirect_to
            render :new #la variable de instcia @article, es pasada a la vista new
        end
        
        
    end

    def update

        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit' 
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to article_path
    end



    private

        def article_params
            params.require(:article).permit(:title, :text, :category_list, :category,  attachments: [])
        end

        def set_article
            @article = Article.find(params[:id])
        end


    



end
