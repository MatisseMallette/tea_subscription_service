class Api::V1::CustomersController < ApplicationController
  # A little non-restful action for funsies.
  def say_hello
    render json: "Hello, world!"
  end

  def index
    render json: CustomerSerializer.new(Customer.all)
  end

  def create
    
  end
end
