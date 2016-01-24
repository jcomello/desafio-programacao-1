class RemoveItemDescriptionFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :item_description, :text
  end
end
