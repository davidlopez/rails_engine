require 'rails_helper'

describe 'Best_day for Specific specific item' do
  it 'Returns revenue for an items best day' do
    customer = create(:customer)
    merchant_1 = create(:merchant, name: 'cheets')
    item = merchant_1.items.create(name: 'Cheetos', description: 'mmmmm snacks', unit_price: 100)
    invoice = Invoice.create(status: 'shipped', merchant_id: merchant_1.id, customer_id: customer.id, created_at: "2012-03-27 14:53:59 UTC")
    invoice.invoice_items.create(item_id: item.id, quantity: 20, unit_price: 100, created_at: "2012-03-27 14:53:59 UTC")
    invoice.transactions.create(credit_card_number: '1234567887654321', result: 'success', created_at: "2012-03-27 14:53:59 UTC")

    invoice_2 = Invoice.create(status: 'shipped', merchant_id: merchant_1.id, customer_id: customer.id, created_at: "2012-01-27 14:53:59 UTC")
    invoice_2.invoice_items.create(item_id: item.id, quantity: 500, unit_price: 100, created_at: "2012-01-27 14:53:59 UTC")
    invoice_2.transactions.create(credit_card_number: '1234567887654321', result: 'success', created_at: "2012-01-27 14:53:59 UTC")

    get "/api/v1/items/#{item.id}/best_day"

    date = JSON.parse(response.body)['data']

    expect(date['attributes']['best_day']).to eq("2012-01-27")
  end
end
