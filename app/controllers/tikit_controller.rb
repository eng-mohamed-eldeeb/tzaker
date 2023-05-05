class TikitsController < ApplicationController
    before_action :authenticate_user!

    def index
        render json: Tikit.all
    end

    def show
        render json: Tikit.find(params[:id])
    end

    def create
        tikit = current_user.tikits.new(tikit_params)
        if tikit.save
            render json: tikit, status: :created
        else
            render json: tikit.errors, status: :unprocessable_entity
        end
    end

    def destroy
        tikit = Tikit.find(params[:id])
        tikit.destroy
    end

    private

    def tikit_params
        params.require(:tikit).permit(:user_id, :concert_id, :seat_type)
    end


end