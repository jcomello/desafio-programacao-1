class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def upload
    @orders = Order.new
  end

  def uploaded
    Order.save_from_file(params[:upload].path)

    flash[:notice] = "Upload feito com sucesso"
    redirect_to orders_path
  end
end
