require_relative 'modules/index_and_show'
class Api::V1::MerchantsController < ApplicationController
  include IndexAndShow

  private

    def find_params
      params.permit(:name, :id, :created_at, :updated_at)
    end
end
