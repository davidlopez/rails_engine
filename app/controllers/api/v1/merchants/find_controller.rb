require './app/controllers/api/v1/modules/findable'
class Api::V1::Merchants::FindController < ApplicationController
  include Findable

  private

    def find_params
      params.permit(:name, :id, :created_at, :updated_at)
    end
end
