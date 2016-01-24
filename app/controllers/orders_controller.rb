class OrdersController < ApplicationController
  def index
  end

  def upload
    @orders = Order.new
  end

  def uploaded
    redirect_to orders_path
  end
end
