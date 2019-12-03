require 'rails_helper'

describe 'Items merchant endpoint' do
  it 'Does a json output for a merchant object tied to a specific item' do
    item = create(:item)

    get "/api/v1/items/#{item.id}/merchant"

    merchant = JSON.parse(response.body)['data']
    expect(merchant['attributes']['id']).to eq(item.merchant.id)
  end
end
