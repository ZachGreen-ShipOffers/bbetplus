class OrdersController < ApplicationController
  # respond_to :json

  def index
    count = ClientsOrder.all().count()
    @orders = ClientsOrder.all().order('order_date DESC').page params[:page]
    # h = {
    #   total: count,
    #   total_page: (count / 50),
    #   per_page: 50,
    #   page: params[:page] || 1
    # }
    # @orders.push h

    render json: @orders
  end

  def update_order
    # # ap params
    # order = ClientsOrder.find params[:order][:id]
    # saved = false
    # ClientsOrder.transaction do
    #   params[:order].each do |k,v|
    #     insert = {}
    #     insert[k.to_sym] = "#{v}"
    #     order.update insert
    #   end
    #   saved = order.save!
    # end
    # if saved
    #   respond_with status: 200
    # else
    #   respond_with status: 500
    # end
    render json: params
  end

  def update_item
    item = ClientsOrderItem.find params[:order][:id]
    saved = false
    ClientsOrderItem.transaction do
      params[:order].each do |k,v|
        next if k == "description"
        if k == "sku"
          s = ClientsSku.find_by(sku: v)
          item.update({clients_sku_id: s.id})
          next
        end
        insert = {}
        insert[k.to_sym] = "#{v}"
        item.update insert
      end
      saved = item.save!
    end
    if saved
      respond_with status: 200
    else
      respond_with status: 500
    end
  end

  def order
    respond_with ClientsOrder.find params[:id]
  end

  def items
    id = params[:id]
    items_skus = <<-eos
    SELECT
      clients_order_items.*,
      clients_skus.sku,
      clients_skus.description
    FROM
      clients_order_items
    JOIN
      clients_skus
    ON
      clients_order_items.clients_sku_id = clients_skus.id
    WHERE
      clients_order_id = #{id};
    eos
    @items = ActiveRecord::Base.connection.exec_query(items_skus, 'Items and Skus')
    render json:  @items
  end

  def skus
    id = params[:id].to_i
    sku_sql = <<-eos
    SELECT clients_skus.* from clients_skus where clients_skus.clients_store_id = #{id} and active = 't'
    eos

    @skus = ActiveRecord::Base.connection.exec_query(sku_sql, 'Grab all client skus')
    render json:  @skus
  end

end
