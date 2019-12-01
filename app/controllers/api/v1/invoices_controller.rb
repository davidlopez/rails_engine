require_relative 'modules/index_and_show'
class Api::V1::InvoicesController < ApplicationController
  include IndexAndShow
end
