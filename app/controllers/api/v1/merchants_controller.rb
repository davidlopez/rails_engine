require_relative 'modules/index_and_show'
class Api::V1::MerchantsController < ApplicationController
  include IndexAndShow
end
