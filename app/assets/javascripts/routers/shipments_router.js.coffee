class Bbetplus.Routers.Shipments extends Backbone.Router

  routes:
    'shipments': 'index'

  index: ->
    view = new Bbetplus.Views.ShipmentsIndex()
    $('#content').html(view.render().el)
