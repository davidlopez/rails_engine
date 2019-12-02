require 'rails_helper'

describe "Item JSON" do
  it "sends a list of items" do
     create_list(:item, 3)

      get '/api/v1/items'

      expect(response).to be_successful

      items = JSON.parse(response.body)
      expect(items['data'].length).to eq(3)
   end

  it "sends a single item" do
      item = create(:item)

      get "/api/v1/items/#{item.id}"

      expect(response).to be_successful

      item = JSON.parse(response.body)

      expect(item['data'].length).to eq(3)
   end

  it 'is case insensitive for name' do
    item = create(:item)
    name = item.name.downcase
    get "/api/v1/items/find?name=#{name}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy
  end

  it 'Finds single items based on options' do
    item = create(:item)

    get "/api/v1/items/find?id=#{item.id}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy

    item = create(:item, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/items/find?created_at=#{item.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy

    item = create(:item,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/items/find?created_at=#{item.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy
  end

  it 'Returns nil for incorrect options' do
    item = create(:item)

    get "/api/v1/items/find?name=hasdfasdfasdfi"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey

    get "/api/v1/items/find?id=10000"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey

    item = create(:item, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/items/find?created_at=5"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey

    item = create(:item,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/items/find?created_at=7"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey
  end
end
