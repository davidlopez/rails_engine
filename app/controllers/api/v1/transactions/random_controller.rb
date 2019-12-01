require './app/controllers/api/v1/modules/randomable'

class Api::V1::Transactions::RandomController < ApplicationController
  include Randomable
end
