class Wespot.Views.DishesIndex extends Backbone.View
  template: JST['dishes/index']

  events:
    'keypress #new-dish'    : "createOnEnter"
  
  initialize: ->
    @collection.on 'reset', @render
    @collection.on 'add', @appendDish
  
  render: =>
    $(@el).html(@template())
    @collection.each @appendDish
    this
  
  appendDish: (dish) =>
    view = new Wespot.Views.Dish(model: dish)
    @$('#dish-list').append view.render().el

  createOnEnter: (event) ->
    text = @$('#new-dish').val()
    if text and event.keyCode is 13
      @collection.create name: text
      @$('#new-dish').val('')