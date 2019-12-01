require './app/controllers/api/v1/modules/randomable'

class Api::V1::Invoices::RandomController < ApplicationController
  include Randomable
end
