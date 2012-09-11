window.Wespot =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
          new Wespot.Routers.Dishes
          Backbone.history.start()

$(document).ready ->
  Wespot.init()