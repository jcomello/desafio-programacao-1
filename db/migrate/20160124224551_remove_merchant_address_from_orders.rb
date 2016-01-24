class RemoveMerchantAddressFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :merchant_address, :string
  end
end
