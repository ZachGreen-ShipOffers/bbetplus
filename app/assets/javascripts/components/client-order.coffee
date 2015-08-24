Bbetplus.ClientOrderComponent = Ember.Component.extend(
  actions: {
    edit: (order)->
      @order = order
      $('#order_number').val(order.get 'order_number')
      $('#ship_name').val(order.get 'ship_name')
      $('#address1').val(order.get 'address1')
      $('#address2').val(order.get 'address2')
      $('#city').val(order.get 'city')
      $('#state').val(order.get 'state')
      $('#postal_code').val(order.get 'postal_code')
      # $('#orderId').val(order.orderId)
      $('#orderinfo').show()
    closeModal: ->
      $('#orderinfo').hide()
    submitOrder: (id)->
      @order.set 'order_number', $('#order_number').val()
      @order.save()
  }

)
