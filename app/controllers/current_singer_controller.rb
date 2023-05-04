class CurrentSingerController < ApplicationController
  before_action :authenticate_singer!
  def index
    render json: current_singer
  end
end
