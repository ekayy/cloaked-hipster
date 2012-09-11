class Wespot.Routers.Dishes extends Backbone.Router
  routes:
    '': 'index'
    'dishes/:id': 'show'
                
  initialize: ->
    @collection = new Wespot.Collections.Dishes()
    @collection.fetch()

  index: ->
    view = new Wespot.Views.DishesIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Dish #{id}"