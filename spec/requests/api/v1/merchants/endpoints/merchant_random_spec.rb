require 'rails_helper'

describe "Merchant random JSON" do
  it 'returns a random merchant' do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    get "/api/v1/merchants/random"
    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']['attributes']['id']).to eq(merchant.id).or eq(merchant_2.id)
  end
end
