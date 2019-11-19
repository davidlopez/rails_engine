require_relative 'modules/decimalable'

class Item < ApplicationRecord
  include Decimalable
  
  belongs_to :merchant
  validates_presence_of :name
  before_validation :change_to_decimal
end
