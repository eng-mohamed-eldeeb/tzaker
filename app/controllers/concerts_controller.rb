class ConcertsController < ApplicationController

    before_action :authenticate_singer_or_company!


    def authenticate_singer_or_company!
        if singer_signed_in? || company_signed_in?
          return true
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
          return false
        end
    end
    
    
    def index
    end

    def show
        render json: Concert.find(params[:id])
    end

    def create
        if company_signed_in?
            current_company.concerts.new({
              silver_seats_price: concert_params[:silver_seats_price],
              gold_seats_price: concert_params[:gold_seats_price],
              platinum_seats_price: concert_params[:platinum_seats_price],
              date: concert_params[:date],
              start_time: concert_params[:start_time],
              end_time: concert_params[:end_time],
              venue_id: concert_params[:venue_id],
              singer_id: concert_params[:singer_id],
              status: "pending_by company"
            })
          elsif singer_signed_in?
            concert_status = 
            current_singer.concerts.new({
              silver_seats_price: concert_params[:silver_seats_price],
              gold_seats_price: concert_params[:gold_seats_price],
              platinum_seats_price: concert_params[:platinum_seats_price],
              date: concert_params[:date],
              start_time: concert_params[:start_time],
              end_time: concert_params[:end_time],
              venue_id: concert_params[:venue_id],
              company_id: concert_params[:company_id],
              status: "pending_by singer"
            })
          end
          
          
        # concert = current_company.concerts.new(concert_params)
        if concert.save
            render json: concert, status: :created
        else
            render json: concert.errors, status: :unprocessable_entity
        end
    end

    def update
        if singer_signed_in? && Concert.find(params[:id]).status == "pending_by company" && current_singer.id == Concert.find(params[:id]).singer_id
            render json: current_singer.concerts.find(params[:id]).update(get_concert_status)
        elsif conpany_signed_in? && Concert.find(params[:id]).status == "pending_by singer" && current_company.id == Concert.find(params[:id]).conpany_id
            render json: current_company.concerts.find(params[:id]).update(get_concert_status)
        else
            render json: Concert.find(params[:id])
        end
    end

    def destroy
        concert = Concert.find(params[:id])
        concert.destroy
    end

    private

    def concert_params
        params.require(:concert).permit(:date,:singer_id, :company_id , :venue_id, :silver_seats_price, :gold_seats_price, :platinum_seats_price, :start_time, :end_time, :singer_id)
    end
    
    def get_concert_status
        params.require(:concert).permit(:status)
    end
    
    
end