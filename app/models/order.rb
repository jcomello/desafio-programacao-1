require 'csv'

class Order < ActiveRecord::Base
  belongs_to :purchaser
  has_one :item
  belongs_to :merchant

  def self.gross_revenue
    joins(:item).sum("purchase_count * items.price").to_d
  end
end
