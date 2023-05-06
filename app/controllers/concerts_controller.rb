class ConcertsController < ApplicationController

    before_action :authenticate_singer_or_company_or_user!


    def authenticate_singer_or_company_or_user!
        return if singer_signed_in? || company_signed_in? || user_signed_in?
      
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
      
    
    
    def index
        if singer_signed_in?
            render json: current_singer.concerts
        elsif company_signed_in?
            render json: current_company.concerts
        elsif user_signed_in?
            render json: Concert.where(status: "approved")
        end
    end

    def show
        render json: Concert.find(params[:id])
    end

    def show_concert_tikits
        render json: Concert.find(params[:id]).tikits
    end

    def show_concert_tikits_count
        tikits = {
            platinum: Concert.find(params[:id]).tikits.where(seat_type: "platinum").count,
            gold: Concert.find(params[:id]).tikits.where(seat_type: "gold").count,
            silver: Concert.find(params[:id]).tikits.where(seat_type: "silver").count
        }
        render json: tikits
    end

    def show_concert_tikits_price
        tikits = {
            platinum: Concert.find(params[:id]).tikits.where(seat_type: "platinum").count * Concert.find(params[:id]).platinum_seats_price,
            gold: Concert.find(params[:id]).tikits.where(seat_type: "gold").count * Concert.find(params[:id]).gold_seats_price,
            silver: Concert.find(params[:id]).tikits.where(seat_type: "silver").count * Concert.find(params[:id]).silver_seats_price
        }
        render json: tikits
    end

    def create
        # it will not work because the status is been set here in the backend
        # if concert_params[:status] != "pending_by company" && concert_params[:status] != "pending_by singer"
        #     render json: {error: "has to be pending_by company or pending_by singer"}, status: :unprocessable_entity
        #     return
        # end
        if company_signed_in? 
            concert = current_company.concerts.new({
                **concert_params,
                status: "pending_by company"
            })
          elsif singer_signed_in?
            concert = current_singer.concerts.new({
                **concert_params,
                status: "pending_by singer"
            })
          end
        if concert.save
            render json: concert, status: :created
        else
            render json: concert.errors, status: :unprocessable_entity
        end
    end

    def update
        if concert_update_params[:status] != "accepted" && concert_update_params[:status] != "rejected"
            render json: {error: "has to be accepted or rejected"}, status: :unprocessable_entity
            return
        end
        concert = Concert.find(params[:id])
        if singer_signed_in? && concert.pending_by_company? && current_singer.id == concert.singer_id
          current_singer.concerts.find(params[:id]).update(concert_update_params)
        elsif company_signed_in? && concert.pending_by_singer? && current_company.id == concert.company_id
          current_company.concerts.find(params[:id]).update(concert_update_params)
        else
          return
        end
        render json: "updated"
      end

    def destroy
        if company_signed_in? || singer_signed_in?
            Concert.find(params[:id]).tikits.destroy_all
            concert = Concert.find(params[:id])
            concert.destroy
        end
    end

    private

    def concert_params
        params.require(:concert).permit(:date,:singer_id, :company_id , :venue_id, :silver_seats_price, :gold_seats_price, :platinum_seats_price, :start_time, :end_time, :singer_id)
    end
    
    def concert_update_params
        params.require(:concert).permit(:status)
      end
      
    
    
end