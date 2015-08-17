class Bbetplus.Routers.Orders extends Backbone.Router
  routes:
    '': 'index'

  # initialize: ->

  index: ->
    orders = new Bbetplus.Collections.Orders();
    orders.fetch({
      success: (c,res,opts)->
        view = new Bbetplus.Views.OrdersIndex()
        $('#content').html(view.render(c).el)
      });
