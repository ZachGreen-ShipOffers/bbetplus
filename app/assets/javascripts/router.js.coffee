# For more information see: http://emberjs.com/guides/routing/

Bbetplus.Router.map ()->
  @route('orders', {path: '/orders'}, (->
    @route('new')
  ))
