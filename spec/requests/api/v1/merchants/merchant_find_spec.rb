require 'rails_helper'

describe "Merchant JSON" do
  it "sends a list of merchants" do
     create_list(:merchant, 3)

      get '/api/v1/merchants'

      expect(response).to be_successful

      merchants = JSON.parse(response.body)
      expect(merchants['data'].length).to eq(3)
   end

  it "sends a single merchant" do
      merchant = create(:merchant)

      get "/api/v1/merchants/#{merchant.id}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body)

      expect(merchant['data'].length).to eq(3)
   end

  it 'is case insensitive for name' do
    merchant = create(:merchant)
    name = merchant.name.downcase
    get "/api/v1/merchants/find?name=#{name}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy
  end

  it 'Finds single merchants based on options' do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?id=#{merchant.id}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy

    merchant = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy

    merchant = create(:merchant,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy
  end

  it 'Returns nil for incorrect options' do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?name=hi"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey

    get "/api/v1/merchants/find?id=10000"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey

    merchant = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find?created_at=5"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey

    merchant = create(:merchant,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find?created_at=7"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey
  end
end
