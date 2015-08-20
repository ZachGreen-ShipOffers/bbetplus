class ClientsOrder < ActiveRecord::Base
  has_many :clients_order_items
  attr_accessor :skus

end
