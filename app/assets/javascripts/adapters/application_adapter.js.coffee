# Override the default adapter with the `DS.ActiveModelAdapter` which

Bbetplus.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api',
  host: 'http://localhost:3000'
})
