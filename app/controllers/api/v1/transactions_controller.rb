require_relative 'modules/index_and_show'
class Api::V1::TransactionsController < ApplicationController
  include IndexAndShow
end
