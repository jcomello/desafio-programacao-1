class RemovePurchaserNameFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :purchaser_name, :string
  end
end
