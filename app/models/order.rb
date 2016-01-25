require 'csv'

class Order < ActiveRecord::Base
  belongs_to :purchaser
  has_one :item
  belongs_to :merchant

  def self.gross_revenue
    all.inject(0.0) do |sum, order|
      sum += order.item.price*order.purchase_count
    end
  end
end
