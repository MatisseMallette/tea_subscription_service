class RemoveSubscriptionRefFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :customers, :subscription, foreign_key: true
  end
end
