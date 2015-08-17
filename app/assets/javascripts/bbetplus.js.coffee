window.Bbetplus =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Bbetplus.Routers.Orders()
    Backbone.history.start()

$(document).ready ->
  Bbetplus.initialize()
