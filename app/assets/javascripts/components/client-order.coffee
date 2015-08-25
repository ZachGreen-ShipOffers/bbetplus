Bbetplus.ClientOrderComponent = Ember.Component.extend(
  actions: {
    edit: (order)->
      @order = order
      skus = []
      $items = $('#items')
      $('#order_number').val(order.get 'order_number')
      $('#ship_name').val(order.get 'ship_name')
      $('#address1').val(order.get 'address1')
      $('#address2').val(order.get 'address2')
      $('#city').val(order.get 'city')
      $('#state').val(order.get 'state')
      $('#postal_code').val(order.get 'postal_code')
      _.each order.get('clients_order_items'), ((e,i,l)->
        str = '<div class="fields">'
        str += '<div class="field"><label>quantity</label>'
        str += '<input type="text" id="quantity" value="'+e.quantity+'"></div>'
        str += '<div class="field"><label>Sku</label>'
        str += '<input type="text" id="sku" class="sku" value="'+e.clients_sku.sku+'"></div>'
        str += '<div class="field"><label>Description</label>'
        str += '<input type="text" id="desc" value="'+e.clients_sku.description+'"></div>'
        str += '</div>'
        $items.append str

        storeId = order.get 'clients_store_id'
        $.getJSON("http://localhost:3000/api/skus/#{storeId}", (data)->
          _.each data.orders, (e,i,l)->
            skus.push e.sku
          console.log skus
        )

        $('.sku').autocomplete(
          source: skus
        )
      )

      # $('#orderId').val(order.orderId)
      $('#orderinfo').show()
    closeModal: ->
      $('#orderinfo').hide()
      $('#items').html ''
    submitOrder: (id)->
      @order.set 'order_number', $('#order_number').val()
      @order.set 'ship_name', $('#ship_name').val()
      @order.set 'address1', $('#address1').val()
      @order.set 'address2', $('#address2').val()
      @order.set 'city', $('#city').val()
      @order.set 'state', $('#state').val()
      @order.set 'postal_code', $('#postal_code').val()
      # @order.save()
  }

)
