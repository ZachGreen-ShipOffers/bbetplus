class ClientsSku < ActiveRecord::Base
  has_many :clients_order_items

end
