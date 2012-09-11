class Wespot.Views.Dish extends Backbone.View
  template: JST['dishes/dish']
  tagName: 'li'
  
  events:
    'dblclick .dish-text'     : "edit"
    'click    .dish-destroy'  : "clear"
    'keypress .dish-input'    : "updateOnEnter"
  
  initialize: ->
    @model.on 'change', @render
    @model.on 'destroy', @remove
  
  render: ->
    $(@el).html(@template(dish: @model))
    this
    
  edit: ->
    $(@el).addClass 'editing'
    @$('.dish-input')
      .val(@model.get('name'))
      .focus()
      .on 'blur', =>
        @model.save name: @$('.dish-input').val()
        $(@el).removeClass 'editing'

  updateOnEnter: (event) ->
    @$('.dish-input').trigger('blur') if event.keyCode is 13

  clear: ->
    @model.destroy()
    
  remove: =>
    $(@el).remove()