require_relative 'modules/index_and_show'
class Api::V1::CustomersController < ApplicationController
  include IndexAndShow
end
