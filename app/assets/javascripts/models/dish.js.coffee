class Wespot.Models.Dish extends Backbone.Model

	validate: (attrs) -> "must not be blank" if attrs.name is ''