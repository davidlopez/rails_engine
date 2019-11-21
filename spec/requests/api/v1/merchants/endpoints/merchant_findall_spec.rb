require 'rails_helper'

describe "Merchant Find all JSON" do
  it 'is case insensitive for name and returns all with that attribute' do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    name = merchant.name.downcase
    get "/api/v1/merchants/find_all?name=#{name}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(2)
  end

  it 'Finds single merchants based on options and returns all with that attribute' do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)

    get "/api/v1/merchants/find_all?id=#{merchant.id}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(1)

    merchant = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")
    merchant_2 = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find_all?created_at=#{merchant.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(2)

    merchant = create(:merchant,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
    merchant_2 = create(:merchant,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find_all?created_at=#{merchant.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(2)
  end
end
