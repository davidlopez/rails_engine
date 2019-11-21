require_relative 'modules/decimalable'

class InvoiceItem < ApplicationRecord
  include Decimalable

  belongs_to :item
  belongs_to :invoice
  before_validation :change_to_decimal
  has_many :transactions, through: :invoice
end
