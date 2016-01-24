class MerchantRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :merchant, index: true, foreign_key: true
  end
end
