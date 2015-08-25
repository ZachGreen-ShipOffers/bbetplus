Bbetplus.Item = DS.Model.extend(
  clients_order_id: DS.belongsTo('order')
  quantity: DS.attr 'string'
  clients_sku: DS.belongsTo('sku')
)

Bbetplus.ItemSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin, {
  attrs:
    clients_sku:
      embedded: 'always'
})
