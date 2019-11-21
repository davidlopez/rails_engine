require 'rails_helper'
describe 'Specific merchant items page' do
  it 'shows all items for specified merchants' do
    merchant = create(:merchant)
    item_1 = create(:invoice, merchant_id: merchant.id)
    item_2 = create(:invoice, merchant_id: merchant.id)
    item_3 = create(:invoice, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices['data'].length).to eq(3)
  end
end
