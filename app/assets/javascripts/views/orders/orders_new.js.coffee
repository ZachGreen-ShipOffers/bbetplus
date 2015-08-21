class Bbetplus.Views.OrdersNew extends Backbone.View
  template: JST['orders/new']

  events:
    'click #additem': 'addItem'
    'click #createorder': 'createOrder'
    'click .fa.fa-times': 'closeItem'


  render: ()->
    $(@el).html(@template())
    this

  addItem: ->
    str = "<div class='fields'>"
    str += "<a href='' onclick='event.preventDefault();'><i class='fa fa-times'></i></a>"
    str += "<div class='field'>"
    str += "<label>Quantity</label>"
    str += "<input type='text' class='quantity' placeholder='quantity'/>"
    str += "</div>"
    str += "<div class='field'>"
    str += "<label>Sku</label>"
    str += "<input type='text' class='sku' placeholder='sku'/>"
    str += "</div>"
    str += "<div class='field'>"
    str += "<label>Description</label>"
    str += "<input type='text' class='description' placeholder='description'/>"
    str += "</div>"
    str +="</div>"
    $('#items').append(str)

  createOrder: ->
    item = new Bbetplus.Models.Item()
    order = new Bbetplus.Models.Order()
    console.log 'created'

  closeItem: (e)->
    console.log e.currentTarget.closest('.fields').remove()
