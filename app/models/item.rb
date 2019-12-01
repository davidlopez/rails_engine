require_relative 'modules/decimalable'

class Item < ApplicationRecord
  include Decimalable

  belongs_to :merchant
  validates_presence_of :name
  before_validation :change_to_decimal
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.most_revenue(limit)
    joins(invoice_items: :transactions).
    select("items.*, sum(invoice_items.unit_price * invoice_items.quantity) as rev").
    group(:id).
    merge(Transaction.successful).
    order(rev: :desc).limit(limit)
  end

  def best_day
    invoice_items.joins(invoice: :transactions).merge(Transaction.successful).
    select("invoices.created_at as best_day, sum(invoice_items.quantity) as quantity").
    group(:best_day).
    order('quantity desc, best_day desc').first.best_day.strftime("%Y-%m-%d")
  end
end
