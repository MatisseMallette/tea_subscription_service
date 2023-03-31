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
    end
  end
end
