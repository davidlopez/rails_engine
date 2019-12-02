require 'rails_helper'

describe "Customer JSON" do
  it "sends a list of customers" do
     create_list(:customer, 3)

      get '/api/v1/customers'

      expect(response).to be_successful

      customers = JSON.parse(response.body)
      expect(customers['data'].length).to eq(3)
   end

  it "sends a single customer" do
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer['data'].length).to eq(3)
   end

  it 'is case insensitive for name' do
    customer = create(:customer)
    first_name = customer.first_name.downcase
    get "/api/v1/customers/find?first_name=#{first_name}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy
  end

  it 'Finds single customers based on options' do
    customer = create(:customer)

    get "/api/v1/customers/find?id=#{customer.id}"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy

    customer = create(:customer, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/customers/find?created_at=#{customer.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy

    customer = create(:customer,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/customers/find?created_at=#{customer.created_at}"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_truthy
  end

  it 'Returns nil for incorrect options' do
    customer = create(:customer)

    get "/api/v1/customers/find?first_name=hi"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey

    get "/api/v1/customers/find?id=10000"

    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey

    customer = create(:customer, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/customers/find?created_at=5"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey

    customer = create(:customer,created_at: "2012-03-27 13:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/customers/find?created_at=7"

    expect(response).to be_successful
    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']).to be_falsey
  end
end
