require 'rails_helper'
describe 'Specific merchant items page' do
  it 'shows all items for specified merchants' do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    item_3 = create(:item, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items['data'].length).to eq(3)
  end
end
