require 'rails_helper'

RSpec.describe "Api::V1::Subscriptions", type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  describe 'get subscriptions' do
    it 'can return a list of all subscriptions' do
      tea1 = Tea.create!(title: 'Tea1', description: 'Tea1 description', temperature: 'Tea1 temperature', brew_time: 'Tea1 brew time')
      tea2 = Tea.create!(title: 'Tea2', description: 'Tea2 description', temperature: 'Tea2 temperature', brew_time: 'Tea2 brew time')
      tea3 = Tea.create!(title: 'Tea3', description: 'Tea3 description', temperature: 'Tea3 temperature', brew_time: 'Tea3 brew time')
      customer = Customer.create!(first_name: 'Jeff', last_name: 'Johnson', email: "jeffjohnson@gmail.com", address: '123 Main Street')
      subscriptio1 = Subscription.create!(title: 'cool subscription 1', price: 'a lot', status: 'active', frequency: 'daily', tea: tea1, customer: customer)
      subscription2 = Subscription.create!(title: 'cool subscription 2', price: 'a lot', status: 'active', frequency: 'daily', tea: tea2, customer: customer)
      subscription3 = Subscription.create!(title: 'cool subscription 3', price: 'a lot', status: 'active', frequency: 'daily', tea: tea3, customer: customer)

      get '/api/v1/subscriptions'

      subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(subscriptions).to be_an(Array)
      expect(subscriptions.length).to eq(3)
      expect(subscriptions.first.keys).to eq([:id, :type, :attributes, :relationships])
      expect(subscriptions.first[:attributes].keys).to eq([:title, :price, :status, :frequency])

      subscriptions.each do |subscription|
        expect(subscription[:id]).to be_a(String)
        expect(subscription[:type]).to eq('subscription')
        expect(subscription[:attributes][:title]).to be_a(String)
        expect(subscription[:attributes][:price]).to be_a(String)
        expect(subscription[:attributes][:status]).to be_a(String)
        expect(subscription[:attributes][:frequency]).to be_a(String)
      end

      expect(subscriptions.first[:attributes][:title]).to eq(Subscription.first.title)
      expect(subscriptions.last[:attributes][:title]).to eq(Subscription.last.title)
    end
  end

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

      post "/api/v1/subscriptions", params: subscription_params

      expect(response).to be_successful

      expect(Subscription.last.title).to eq(subscription_params[:title])
      expect(Subscription.last.price).to eq(subscription_params[:price])
      expect(Subscription.last.status).to eq(subscription_params[:status])
      expect(Subscription.last.frequency).to eq(subscription_params[:frequency])
    end
  end

  describe 'patch subscription' do
    it 'can update the status of a subscription' do
      tea = Tea.create!(title: 'Tea1', description: 'Tea1 description', temperature: 'Tea1 temperature', brew_time: 'Tea1 brew time')
      customer = Customer.create!(first_name: 'Jeff', last_name: 'Johnson', email: "jeffjohnson@gmail.com", address: '123 Main Street')
      subscription = Subscription.create!(title: 'cool subscription', price: 'a lot', status: 'active', frequency: 'daily', tea: tea, customer: customer)

      patch "/api/v1/subscriptions/#{subscription.id}?status=cancelled"

      expect(response).to be_successful

      expect(Subscription.find(subscription.id).status).to eq('cancelled')
    end
  end
end
