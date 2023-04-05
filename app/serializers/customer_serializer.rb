class CustomerSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :address
  # doesn't seem useful ATM
  # has_many :subscriptions, serializer: SubscriptionSerializer
end
