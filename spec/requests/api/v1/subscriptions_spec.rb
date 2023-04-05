require 'rails_helper'

RSpec.describe "Api::V1::Subscriptions", type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  describe 'post subscription' do
    it 'can create a new subscription' do
      subscription_params = {
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
