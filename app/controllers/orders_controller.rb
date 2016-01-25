class OrdersController < ApplicationController
  def index
    @gross_revenue = OrderUpload.inserted_orders.gross_revenue
    @orders = Order.all
  end

  def upload
    @orders = Order.new
  end

  def uploaded
    OrderUpload.save_from_file(params[:upload].path)

    flash[:notice] = "Upload feito com sucesso"
    redirect_to orders_path
  end
end
