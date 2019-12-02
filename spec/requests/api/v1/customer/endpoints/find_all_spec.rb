require 'rails_helper'

describe "Customer Find all JSON" do
  it 'is case insensitive for name and returns all with that attribute' do
    customer = create(:customer)
    customer_2 = create(:customer)
    first_name = customer.first_name.downcase
    get "/api/v1/customers/find_all?first_name=#{first_name}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(2)
  end

  it 'Finds single customers based on options and returns all with that attribute' do
    customer = create(:customer)
    customer_2 = create(:customer)

    get "/api/v1/customers/find_all?id=#{customer.id}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(1)

    customer = create(:customer, created_at: "2012-03-27 14:53:59 UTC")
    merchant_2 = create(:customer, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/customers/find_all?created_at=#{customer.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(2)

    customer = create(:customer,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
    customer_2 = create(:customer,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/customers/find_all?created_at=#{customer.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data'].length).to eq(2)
  end
end
