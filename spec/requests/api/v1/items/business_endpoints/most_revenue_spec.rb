require 'rails_helper'

describe 'Item most revenue' do
  describe 'returns x amount of items with the most revenue' do
    it 'has a proper endpoint for the items' do
      customer = create(:customer)
      merchant_1 = create(:merchant, name: 'cheets')
      invoice = Invoice.create(status: 'shipped', merchant_id: merchant_1.id, customer_id: customer.id)
      item = merchant_1.items.create(name: 'Cheetos', description: 'mmmmm snacks', unit_price: 100)
      invoice.invoice_items.create(item_id: item.id, quantity: 20, unit_price: 100)
      invoice.transactions.create(credit_card_number: '1234567887654321', result: 'success')

      merchant_2 = create(:merchant, name: 'dors')
      invoice_2 = Invoice.create(status: 'shipped', merchant_id: merchant_2.id, customer_id: customer.id)
      item_2 = merchant_2.items.create(name: 'Doritos', description: 'mmmmm snacks', unit_price: 100)
      invoice_2.invoice_items.create(item_id: item_2.id, quantity: 10, unit_price: 100)
      invoice_2.transactions.create(credit_card_number: '1234567887654321', result: 'success')

      merchant_3 = create(:merchant, name: 'lay')
      invoice_3 = Invoice.create(status: 'shipped', merchant_id: merchant_3.id, customer_id: customer.id)
      item_3 = merchant_3.items.create(name: 'Lays', description: 'mmmmm snacks', unit_price: 100)
      invoice_3.invoice_items.create(item_id: item_3.id, quantity: 40, unit_price: 100)
      invoice_3.transactions.create(credit_card_number: '1234567887654321', result: 'success')

      get '/api/v1/items/most_revenue?quantity=3'

      expect(response).to be_successful

      items = JSON.parse(response.body)['data']

      expect(items[0]['attributes']['id']).to eq(item_3.id)
      expect(items[1]['attributes']['id']).to eq(item.id)
      expect(items[2]['attributes']['id']).to eq(item_2.id)
    end
  end
end
