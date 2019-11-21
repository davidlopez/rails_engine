class Api::V1::Merchants::Relationships::ItemsController < ApplicationController
  def index
    render json: which_serializer.new(which_resource.where(merchant_id: params['id']))
  end
end
