require './app/controllers/api/v1/modules/randomable'

class Api::V1::Merchants::RandomController < ApplicationController
  include Randomable
end
