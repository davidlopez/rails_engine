require 'rails_helper'

describe 'Merchant Favorite customer' do
  it 'gives a customer obj specified for a merchant' do
    customer_1 = create(:customer)
    merchant_1 = create(:merchant, name: 'cheets')
    invoice = Invoice.create(status: 'shipped', merchant_id: merchant_1.id, customer_id: customer_1.id, created_at: "2015-06-14 11:55:00 UTC")
    item = merchant_1.items.create(name: 'Cheetos', description: 'mmmmm snacks', unit_price: 100)
    invoice.invoice_items.create(item_id: item.id, quantity: 20, unit_price: 100, created_at: "2015-06-14 11:55:00 UTC")
    invoice.transactions.create(credit_card_number: '1234567887654321', result: 'success', created_at: "2015-06-14 11:55:00 UTC")

    merchant_2 = create(:merchant, name: 'dors')
    invoice_2 = Invoice.create(status: 'shipped', merchant_id: merchant_2.id, customer_id: customer_1.id, created_at: "2015-06-14 11:55:00 UTC")
    item_2 = merchant_2.items.create(name: 'Doritos', description: 'mmmmm snacks', unit_price: 100)
    invoice_2.invoice_items.create(item_id: item_2.id, quantity: 10, unit_price: 100, created_at: "2015-06-14 11:55:00 UTC")
    invoice_2.transactions.create(credit_card_number: '1234567887654321', result: 'failed', created_at: "2015-06-14 11:55:00 UTC")

    invoice_3 = Invoice.create(status: 'shipped', merchant_id: merchant_1.id, customer_id: customer_1.id, created_at: "2015-06-14 11:55:00 UTC")
    item_3 = merchant_1.items.create(name: 'Lays', description: 'mmmmm snacks', unit_price: 100)
    invoice_3.invoice_items.create(item_id: item_3.id, quantity: 40, unit_price: 100, created_at: "2015-06-14 11:55:00 UTC")
    invoice_3.transactions.create(credit_card_number: '1234567887654321', result: 'success', created_at: "2015-06-14 11:55:00 UTC")

    get "/api/v1/customers/#{customer_1.id}/favorite_merchant"

    customer = JSON.parse(response.body)['data']
    
    expect(customer['attributes']['id']).to eq(merchant_1.id)
  end
end
