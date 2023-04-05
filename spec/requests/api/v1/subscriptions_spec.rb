require 'rails_helper'

RSpec.describe "Api::V1::Subscriptions", type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  describe 'post subscription' do
    it 'can create a new subscription' do
      customer1 = Customer.create!(first_name: 'Jeff', last_name: 'Johnson', email: "jeffjohnson@gmail.com", address: '123 Main Street')
      tea1 = Tea.create!(title: 'Tea1', description: 'Tea1 description', temperature: 'Tea1 temperature', brew_time: 'Tea1 brew time')
      
      subscription_params = {
        customer_id: customer1.id,
        tea_id: tea1.id,
        title: 'cool subscription',
        price: 'a lot',
        status: 'active',
        frequency: 'daily'
      }

      post '/api/v1/subscriptions', params: subscription_params

      expect(response).to be_successful
      
      expect(Subscription.last.title).to eq(subscription_params[:title])
      expect(Subscription.last.price).to eq(subscription_params[:price])
      expect(Subscription.last.status).to eq(subscription_params[:status])
      expect(Subscription.last.frequency).to eq(subscription_params[:frequency])
    end
  end
end
