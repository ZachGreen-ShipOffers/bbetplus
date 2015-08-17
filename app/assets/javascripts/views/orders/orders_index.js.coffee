class Bbetplus.Views.OrdersIndex extends Backbone.View

  template: JST['orders/index']

  events:
    'click .edit': 'editOrder'
    'click .fa.fa-times': 'closeModal'

  render: (c)->
    $(@el).html(@template(order: c))
    this

  editOrder: (e)->
    id = e.target.dataset.id
    $('#orderinfo').show();

  closeModal: ->
    $('#orderinfo').hide();
