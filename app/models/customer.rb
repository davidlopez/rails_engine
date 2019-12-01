class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  def self.favorite_customer(id)
    select('customers.*, count(*) AS people').
    joins(invoices: [transactions: :merchants]).
    group(:id).
    where(invoices: {merchant_id: id}).
    merge(Transaction.successful).
    order(people: :desc).
    limit(1)[0]
  end

  def fav_merch
    Merchant.find(invoices.joins(:transactions).merge(Transaction.successful).
    joins(:merchant).select('merchants.id').
    group('merchants.id').order('count(transactions.*) desc').first.id)
  end
end
