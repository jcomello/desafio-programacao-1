class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
