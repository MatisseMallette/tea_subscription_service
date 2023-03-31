class Api::V1::CustomersController < ApplicationController
  # A little non-restful action for funsies.
  def say_hello
    render json: "Hello, world!"
  end

  def index
    render json: "1234"
  end
end
