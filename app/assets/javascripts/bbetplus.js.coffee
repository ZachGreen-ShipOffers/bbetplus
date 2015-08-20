window.Bbetplus =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Bbetplus.Routers.Orders()
    new Bbetplus.Routers.Homes()
    new Bbetplus.Routers.Shipments()
    Backbone.history.start()

$(document).ready ->
  Bbetplus.initialize()
