require './app/controllers/api/v1/modules/findable'
class Api::V1::Items::FindController < ApplicationController
  include Findable

  private

    def find_params
      params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
    end
end
