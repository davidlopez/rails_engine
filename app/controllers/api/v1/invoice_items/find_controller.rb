require './app/controllers/api/v1/modules/findable'
class Api::V1::InvoiceItems::FindController < ApplicationController
  include Findable
  
  private

    def find_params
      params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
    end
end
