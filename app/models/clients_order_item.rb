class ClientsOrderItem < ActiveRecord::Base
  belongs_to :clients_order
  belongs_to :clients_sku

end
