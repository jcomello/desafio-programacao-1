require 'csv'

class Order < ActiveRecord::Base
  belongs_to :purchaser
  has_one :item
  belongs_to :merchant
end
