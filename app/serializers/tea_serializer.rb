class TeaSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :temperature, :brew_time
  # doesn't seem useful ATM
  # has_many :subscriptions, serializer: SubscriptionSerializer
end
