class Api::V1::Customers::MerchantsController < ApplicationController

  def show
    render json: MerchantSerializer.new(Customer.find(params[:id]).fav_merch)
  end
end
