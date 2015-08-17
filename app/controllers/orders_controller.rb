class OrdersController < ApplicationController
  respond_to :json

  def index
    @orders = ClientsOrders.all().limit(100)
    respond_with @orders
  end

  def show
    respond_with ClientsOrders.find(params[:id]).limit(100)
  end

end
