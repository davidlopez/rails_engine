require 'rails_helper'

describe "Merchant random JSON" do
  it 'returns a random item' do
    item = create(:item)
    item_2 = create(:item)
    get "/api/v1/items/random"
    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']['attributes']['id']).to eq(item.id).or eq(item_2.id)
  end
end
