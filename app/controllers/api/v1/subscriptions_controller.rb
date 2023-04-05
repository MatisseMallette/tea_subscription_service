class Api::V1::SubscriptionsController < ApplicationController
  def create
    Subscription.create!(subscription_params)
    render json: CustomerSerializer.new(Customer.last)
  end

  def update
    
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency)
  end
end
