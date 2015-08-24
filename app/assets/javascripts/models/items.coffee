Bbetplus.Item = DS.Model.extend(
  orders: DS.belongsTo('order')
  quantity: DS.attr 'string'
  sku: DS.attr 'string'
  description: DS.attr 'string'
)
