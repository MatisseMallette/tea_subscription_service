class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :status, :frequency
  belongs_to :customer, serializer: CustomerSerializer
  belongs_to :tea, serializer: TeaSerializer
end
