require 'rails_helper'

describe "Customer random JSON" do
  it 'returns a random customer' do
    customer = create(:customer)
    customer_1 = create(:customer)
    get "/api/v1/customers/random"
    expect(response).to be_successful

    json_merchant = JSON.parse(response.body)
    expect(json_merchant['data']['attributes']['id']).to eq(customer.id).or eq(customer_1.id)
  end
end
