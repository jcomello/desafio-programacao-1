class RemoveMerchantNameFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :merchant_name, :string
  end
end
