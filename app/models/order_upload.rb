require 'csv'

class OrderUpload
  def self.save_from_file(file_path)
    @order_ids = []
    CSV.read(file_path, {:col_sep => "\t", headers: true}).each do |row|
      @order = Order.find_or_create_by(
        purchaser: Purchaser.find_or_create_by(name: row["purchaser name"]),
        purchase_count: row["purchase count"],
        merchant: Merchant.find_or_create_by(name: row["merchant name"], address: row["merchant address"])
      )

      Item.find_or_create_by(description: row["item description"], price: row["item price"], order: @order)
      @order_ids << @order.id
    end
  end

  def self.inserted_orders
    Order.where(id: @order_ids)
  end
end
