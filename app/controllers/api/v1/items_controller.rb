require_relative 'modules/index_and_show'
class Api::V1::ItemsController < ApplicationController
  include IndexAndShow
end
