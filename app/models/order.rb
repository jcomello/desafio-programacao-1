require 'csv'

class Order < ActiveRecord::Base
  belongs_to :purchaser
end
