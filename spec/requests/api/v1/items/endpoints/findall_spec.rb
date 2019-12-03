require 'rails_helper'

describe "Item Find all JSON" do
  it 'is case insensitive for name and returns all with that attribute' do
    item = create(:item)
    item_2 = create(:item)
    name = item.name.downcase
    get "/api/v1/items/find_all?name=#{name}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(2)
  end

  it 'Finds single items based on options and returns all with that attribute' do
    item = create(:item)
    item_2 = create(:item)

    get "/api/v1/items/find_all?id=#{item.id}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(1)

    item = create(:item, created_at: "2012-03-27 14:53:59 UTC")
    item_2 = create(:item, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/items/find_all?created_at=#{item.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(2)

    item = create(:item,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
    item_2 = create(:item,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/items/find_all?created_at=#{item.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(2)
  end
end
