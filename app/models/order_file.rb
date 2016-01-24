require 'csv'

class OrderFile
  def self.save_from_file(file_path)
    CSV.read(file_path, {:col_sep => "\t", headers: true}).each do |row|
      @order = Order.find_or_create_by(
        purchaser: Purchaser.find_or_create_by(name: row["purchaser name"]),
        purchase_count: row["purchase count"],
        merchant_address: row["merchant address"],
        merchant_name: row["merchant name"]
      )

      Item.find_or_create_by(description: row["item description"], price: row["item price"], order: @order)
    end
  end
end
