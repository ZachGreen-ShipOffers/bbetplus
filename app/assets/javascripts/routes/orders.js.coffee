Bbetplus.OrdersRoute = Ember.Route.extend(
  model: ->
    return Ember.$.getJSON('/api/orders.json')
)
