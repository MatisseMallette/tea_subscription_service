require 'rails_helper'

RSpec.describe Subscription, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'relationships' do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
  end

  describe 'validations' do
  end
end
