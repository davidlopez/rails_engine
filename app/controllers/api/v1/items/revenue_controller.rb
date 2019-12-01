class Api::V1::Items::RevenueController < ApplicationController
  def index
    render json: which_serializer.new(which_resource.most_revenue(params[:quantity]))
  end
end
