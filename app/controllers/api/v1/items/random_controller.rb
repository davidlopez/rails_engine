require './app/controllers/api/v1/modules/randomable'

class Api::V1::Items::RandomController < ApplicationController
  include Randomable
end
