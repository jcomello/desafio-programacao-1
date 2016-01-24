class PurchaserRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :purchaser, index: true, foreign_key: true
  end
end
