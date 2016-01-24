require 'csv'

class Order < ActiveRecord::Base
  def self.save_from_file(file_path)
    CSV.read(file_path, {:col_sep => "\t", headers: true}).each do |row|
      Order.create(
        purchaser_name: row["purchaser name"],
        item_description: row["item description"],
        item_price: row["item price"],
        purchase_count: row["purchase count"],
        merchant_address: row["merchant address"],
        merchant_name: row["merchant name"]
      )
    end
  end
end
