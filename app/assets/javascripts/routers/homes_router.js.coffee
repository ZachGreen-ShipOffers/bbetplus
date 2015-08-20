class Bbetplus.Routers.Homes extends Backbone.Router

  routes:
    '': 'index'

  index: ->
    view = new Bbetplus.Views.HomesIndex()
    $('#content').html(view.render().el)
