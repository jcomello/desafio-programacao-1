require 'csv'

class Order < ActiveRecord::Base
  belongs_to :purchaser
  has_one :item
end
