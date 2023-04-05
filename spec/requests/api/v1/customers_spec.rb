require 'rails_helper'

RSpec.describe "Api::V1::Customers", type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  describe 'get customers' do 
    it 'can return a list of all customers' do
      Customer.create(first_name: 'John', last_name: 'Smith', email: 'john@smith.com', address: '1234 Main Street')
      Customer.create(first_name: 'Bob', last_name: 'Adams', email: 'bob@adams.com', address: '4321 Rurual Path Avenue')

      get '/api/v1/customers'

      expect(response).to be_successful

      customers = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(customers).to be_an(Array)
      expect(customers.length).to eq(2)
      expect(customers.first.keys).to eq([:id, :type, :attributes])
      expect(customers.first[:attributes].keys).to eq([:first_name, :last_name, :email, :address])

      customers.each do |customer|
        expect(customer[:id]).to be_a(String)
        expect(customer[:type]).to eq('customer')
        expect(customer[:attributes][:first_name]).to be_a(String)
        expect(customer[:attributes][:last_name]).to be_a(String)
        expect(customer[:attributes][:email]).to be_a(String)
        expect(customer[:attributes][:address]).to be_a(String)
      end

      expect(customers.first[:attributes][:first_name]).to eq(Customer.first.first_name)
      expect(customers.last[:attributes][:first_name]).to eq(Customer.last.first_name)
    end
  end

  describe 'post customer' do
    it 'can create a new customer' do
      post '/api/v1/customers', params: {
        first_name: 'skwisgaar',
        last_name: 'skwigelf',
        email: 'skwizard92@hotmail.com',
        address: 'Sveeden'
      }
      expect(response).to be_successful
      
    end
  end
end
