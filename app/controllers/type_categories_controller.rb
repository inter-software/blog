class TypeCategoriesController < ApplicationController

    def index
        @type_category = TypeCategory.all
    end

    def new 
        @category = TypeCategory.new

    def edit
        @type_category = TypeCategory.find(params[:id])
    end

    def created
        @category = category.find(params[:id])
        #@type_category =  @category.type_categories.created(type_category_params)
        #"redirect_to category_path(@type_category)

        if  @type_category.save
            redirect_to @type_category
        else
            render 'new'
        end

    end


    def destroy
        @type_category = TypeCategory.find(params[:id])
        @type_category.destroy

        redirect_to @type_category
    end

    def update
        @type_category = TypeCategory.find(params[:id])

        if  @type_category.update
            redirect_to @type_category
        else
            render 'edit'
        end
    end

    private
        def type_category_params
            params.require(:type_category).permit(:name, :audience, :category_id)
        end
end
