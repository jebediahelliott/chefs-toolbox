# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  User has many recipes, Recipe has many amounts, Ingredient has many amounts
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Recipe belongs to User, Amount belongs to Ingredient and Recipe
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  Recipe has many Ingredients through Amounts and vice versa
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  Amount joins Recipe and Ingredient and has an ingredient_amount attribute
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  New users must have a name and password. New Recipe must have a name, and any ingredient, ingredient_amount, or ingredient unit must have the other two corresponding values.
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  Users can filter recipes by if they have been used in the previous 6 weeks
- [x] Include signup (how e.g. Devise)
  Custom signup mechanism
- [x] Include login (how e.g. Devise)
  Custom login using bcrypt and #has_secure_password method
- [x] Include logout (how e.g. Devise)
  link to delete session[:id]
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  OmniAuth with facebook login
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  /users/:user_id/recipes/:id
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  /users/:user_id/recipes/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
