require './app/controllers/api/v1/modules/findable'
class Api::V1::Transactions::FindController < ApplicationController
  include Findable

  private

    def find_params
      params.permit(:id,  :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
    end
end
