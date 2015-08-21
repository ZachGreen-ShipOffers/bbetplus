class Bbetplus.Views.OrdersIndex extends Backbone.View

  template: JST['orders/index']
  aryOfSkus = []

  events:
    'click .edit': 'editOrder'
    'click .fa.fa-times': 'closeModal'
    'click #firstpage': 'getFirstPage'
    'click #nextpage': 'getNextPage'
    'click #prevpage': 'getPrevPage'
    'click #lastpage': 'getLastPage'
    'click #ordersubmit': 'submitOrder'

   initialize: ->
    _.bindAll(this, "submitOrder")

  render: (c,p)->
    $(@el).html(@template({order: c, pageInfo: p}))
    @orders = c
    @info = p
    this

  editOrder: (e)->
    id = e.target.dataset.id
    order = @orders.get(id)
    @items = new Bbetplus.Collections.Items()
    @items.url = "/api/items/#{id}.json"
    @items.fetch({
      success: (c,res,opts)->
        $('#order_number').val(order.get('order_number'))
        $('#ship_name').val(order.get('ship_name'))
        $('#address1').val(order.get('address1'))
        $('#address2').val(order.get('address2'))
        $('#city').val(order.get('city'))
        $('#state').val(order.get('state'))
        $('#postal_code').val(order.get('postal_code'))
        $('#orderId').val(order.cid)

        c.each (i)->
          str = "<h3>Items</h3>"
          str += "<div class='fields' id="+i.cid+">"
          str += "<div class='field'>"
          str += "<label>Quantity</label>"
          str += "<input type='text' class='quantity' value='"+i.get('quantity')+"'/>"
          str += "</div>"
          str += "<div class='field'>"
          str += "<label>Sku</label>"
          str += "<input type='text' class='sku' value='" + i.get('sku')+"'/>"
          str += "</div>"
          str += "<div class='field'>"
          str += "<label>Description</label>"
          str += "<input type='text' class='description' value='" + i.get('description')+"'/>"
          str += "</div>"
          str +="</div>"

          $('#items').append str

    })
    skus = new Bbetplus.Collections.Skus()
    skus.url = "/api/skus/#{order.get('clients_store_id')}.json"
    skus.fetch({
      success: (c,res,opts)->
        console.log res
        _.each res, ((e,i,l)->
          aryOfSkus.push e.sku
        )
        $('.sku').autocomplete({
          source: aryOfSkus
        })
      })
    $('#orderinfo').show()

  closeModal: (e)->
    $('#orderinfo').hide()
    $('#items').html('')

  getNextPage: (e)->
    orders = new Bbetplus.Collections.Orders()
    orders.fetch({
      data: {page: (parseInt(@info.get('page')) + 1) }
      success: (c,res,opts)->
        p = c.models.pop()
        view = new Bbetplus.Views.OrdersIndex()
        $('#content').html(view.render(c,p).el)
      })

  submitOrder: (e)->
    e.preventDefault()
    # set all attrs here
    order = @orders.get($('#orderId').val())
    order.set({
      order_number: $('#order_number').val()
      ship_name: $('#ship_name').val()
      address1: $('#address1').val()
      address2: $('#address2').val()
      city: $('#city').val()
      state: $('#state').val()
      postal_code: $('#postal_code').val()
    })
    fields = $('#items').find('.fields')
    items = $('#items .fields').find('input')
    _.each(fields, ((fe,i,l)->
      item = @items.get($(fe).attr('id'))
      item.url = "/api/items/#{item.id}.json"
      _.each $(fe).find('input'), (ie,i,l)->
        item.set($(ie).attr('class'), $(ie).val())
      item.sync 'update', item, {
        success: (data,status,jqXHR)->
          console.log data, status, jqXHR
      }
    ), this)


    # figure out how to send id with changed data
    # order.sync 'update', order, {
    #   success: (data,status,jqXHR)->
    #     console.log data, status, jqXHR
    #     $('#orderinfo').hide()
    # }
