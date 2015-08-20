class Bbetplus.Views.ShipmentsIndex extends Backbone.View

  template: JST['shipments/index']

  render: ->
    $(@el).html(@template())
    this
