class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: which_serializer.new(which_resource.most_revenue(params[:quantity]))
  end

  def show
    render json: RevenueSerializer.new(Invoice.revenue(params[:date]))
  end
end
