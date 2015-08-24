Bbetplus.OrdersRoute = Ember.Route.extend(
  model: ->
    return @store.findAll('Order')
    # return @store.findAll('orders')
    # return Ember.$.getJSON('/api/orders')
)
