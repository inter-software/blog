class VerifiedsController < ApplicationController

    before_action :set_verified, only: [:show, :edit, :update, :destroy]
    
    before_action :set_all_verified, only: [:index]

    def index       
    end

    def show
    end

    def edit
    end

    def new 
        @verified = Verified.new
    end

    def create
        @verified = Verified.new(verified_params)

        if @verified.save
            redirect_to @verified
        else
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
        end
end
