class VerifiedsController < ApplicationController

    before_action :set_verified, only: [:show, :edit, :update]

    def index
        @verifieds = Verified.all
    end

    def show
    end

    def edit
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
        @verified = Verified.new(verified_params)

        if @verified.update(verified_params)
            redirect_to @verified
        else
            redirect_to :new
        end
    end

    private

        def verified_params
            params.require(:verified).permit(:article_id, :user_id, :date, :comment)
        end

        def set_verified
            @verified = Verified.find(params[:id])
        end
end
