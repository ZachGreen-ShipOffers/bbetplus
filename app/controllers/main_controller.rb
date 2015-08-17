class MainController < ApplicationController
  # respond_to :json
  ActiveSupport.escape_html_entities_in_json = true
  def index
    @orders = ClientsOrders.all().limit(100)
  end
end
