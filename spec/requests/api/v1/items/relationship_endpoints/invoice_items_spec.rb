require 'rails_helper'

describe 'Specific Items invoice_items' do
  it 'Renders json for a collection of invoice_items' do
    item = create(:item)
    invoice_item_1 = create(:invoice_item, item_id: item.id)
    invoice_item_2 = create(:invoice_item, item_id: item.id)

    get "/api/v1/items/#{item.id}/invoice_items"

    invoice_items = JSON.parse(response.body)['data']

    expect(invoice_items[0]['attributes']['id']).to eq(invoice_item_1.id)
    expect(invoice_items[1]['attributes']['id']).to eq(invoice_item_2.id)
  end
end
