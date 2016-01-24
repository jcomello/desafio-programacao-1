class RemoveItemPriceFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :item_price, :decimal
  end
end
