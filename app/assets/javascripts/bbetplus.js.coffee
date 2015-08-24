#= require_tree ./adapters
#= require_tree ./mixins
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self
Bbetplus.Store = DS.Store.extend(
  adapter: DS.RESTAdapter.create(
    url: 'http://localhost:3000'
  )
)
