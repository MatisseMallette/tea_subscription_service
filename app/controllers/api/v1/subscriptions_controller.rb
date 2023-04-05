class Api::V1::SubscriptionsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(params[:tea_id])
    Subscription.create!(subscription_params.merge(customer: customer, tea: tea))
    render json: CustomerSerializer.new(Customer.last)
  end

  def update
    
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency)
  end
end
