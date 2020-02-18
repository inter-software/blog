class VerifiedsController < ApplicationController

    #before_action :set_verified, only: [:show, :edit, :update]

    def index
        @verifieds = Verified.all
    end

    def show
        @verified = Verified.find(params[:id])
    end

    def edit
        @verified = Verified.find(params[:id])
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
        @verified = Verified.find(params[:id])

        if @verified.update(verified_params)
            redirect_to @verified
        else
            redirect_to :edit
        end
    end

    def destroy
        @verified = Verified.find(params[:id])
        @verified.destroy
     
        redirect_to verified_path
    end


    private

        def verified_params
            params.require(:verified).permit(:article_id, :user_id, :date, :comment)
        end
end
