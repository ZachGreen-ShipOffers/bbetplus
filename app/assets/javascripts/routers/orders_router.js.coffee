class Bbetplus.Routers.Orders extends Backbone.Router
  routes:
    'orders': 'index'
    'orders/new': 'new'

  # initialize: ->

  index: ->
    orders = new Bbetplus.Collections.Orders()
    # orders.url = 'http://localhost:3000/api/orders.json'
    orders.fetch({
      success: (c,res,opts)->
        p = c.models.pop()
        view = new Bbetplus.Views.OrdersIndex()
        $('#content').html(view.render(c,p).el)
      })

  new: ->
    view = new Bbetplus.Views.OrdersNew()
    $('#content').html(view.render().el)
