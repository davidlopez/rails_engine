class Api::V1::Items::DatesController < ApplicationController
  def show
    render json: DateSerializer.new(Item.find(params[:id]))
  end
end
