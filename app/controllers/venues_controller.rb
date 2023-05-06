class VenuesController < ApplicationController
    before_action :authenticate_company!, only: [:create, :update, :destroy]
    
    def index
    end

    def show
        render json: Venue.find(params[:id])
    end

    def create
        venue = current_company.venues.new(venue_params)
        if venue.save
            render json: venue, status: :created
        else
            render json: venue.errors, status: :unprocessable_entity
        end
    end

    def update
        venue = Venue.find(params[:id])
        if venue.update(venue_params)
            render json: venue
        else
            render json: venue.errors, status: :unprocessable_entity
        end
    end

    def destroy
        venue = Venue.find(params[:id])
        venue.destroy
    end

    private

    def venue_params
        params.require(:venue).permit(:location, :platinum_seats_count, :gold_seats_count, :silver_seats_count)
    end

  end
  