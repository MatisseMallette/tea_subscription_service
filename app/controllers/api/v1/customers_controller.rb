class Api::V1::CustomersController < ApplicationController
  # A little non-restful action for funsies.
  def say_hello
    render json: "Hello, world!"
  end

  def index
    render json: CustomerSerializer.new(Customer.all)
  end

  def create
    Customer.create!(customer_params)
    render json: CustomerSerializer.new(Customer.last)
  end

  private

  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end
end
