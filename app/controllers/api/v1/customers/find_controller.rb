require './app/controllers/api/v1/modules/findable'
class Api::V1::Customers::FindController < ApplicationController
  include Findable

  private

    def find_params
      params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
    end
end
