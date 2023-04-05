class Api::V1::SubscriptionsController < ApplicationController
  def index 
    render json: SubscriptionSerializer.new(Subscription.all)
  end

  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(params[:tea_id])
    Subscription.create!(subscription_params.merge(customer: customer, tea: tea))
    render json: SubscriptionSerializer.new(Subscription.last)
  end

  def update
    # PATCH /api/v1/customers/:customer_id/subscriptions/:id, params { status }
    # customer = Customer.find(params[:customer_id])
    # subscription = customer.subscriptions.find(params[:id])
    subscription = Subscription.find(params[:id])
    subscription.update(status: subscription_params[:status])
    render json: SubscriptionSerializer.new(subscription)
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency)
  end
end
