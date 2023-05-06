class TikitsController < ApplicationController
    before_action :authenticate_user!
    before_action :is_concert_approved!, only: [:create]

    def index
        render json: { total_tikit_price: current_user.tikits)}
    end

    def show
        render json: current_user.tikits.find(params[:id])
    end

    def create
        if !["gold", "platinum", "silver"].include?(tikit_params[:seat_type])
            render json: {error: "Invalid seat type"}, status: :unprocessable_entity
        elsif Tikit.where(seat_type: tikit_params[:seat_type]).count >= Concert.find(tikit_params[:concert_id]).venue.send("#{tikit_params[:seat_type]}_seats_count")
            render json: {error: "No more #{tikit_params[:seat_type]} seats"}, status: :unprocessable_entity
        else
            tikit = current_user.tikits.new(tikit_params)
            if tikit.save
                render json: tikit, status: :created
            else
                render json: tikit.errors, status: :unprocessable_entity
            end
        end
    end
    

    def destroy
        tikit = current_user.tikits.find(params[:id])
        tikit.destroy
    end

    private

    def tikit_params
        params.require(:tikit).permit(:concert_id, :seat_type)
    end

    def is_concert_approved!
        if Concert.find(tikit_params[:concert_id]).status == "approved"
            return true
        else
            render json: {error: "Concert get a tikit yet"}, status: :unprocessable_entity
            return false
        end
    end


end