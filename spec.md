# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
      => User has_many :answers
      => Question has_many :answers

- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
      => Question belongs_to :user
      => Answer (join table) belongs_to :question, & belongs_to :user

- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)  
      => User has_many :questions, through: :answers

- [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
      => Answers have (:input) either "yes" or "no"

- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      => Question validates_presence_of :query
      
      #=> Answer   validates_presence_of :input
                  validates :user_id && :question_id, :uniqueness => true

- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      => /questions/most_popular  => gives stats for question with the most answers

- [X] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
      => /views/questions/new.html.erb

- [X] Include signup (how e.g. Devise)
      => Devise
- [X] Include login (how e.g. Devise)
      => Devise
- [X] Include logout (how e.g. Devise)
      => Devise
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
      => Devise OmniAuth for Facebook

- [X] Include nested resource show or index (URL e.g. users/2/recipes)
      =>/questions/:id/answers/:id => question_answers show page

- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
      => /questions/:question_id/answers => creates answer to a question

- [X] Include form display of validation errors (form URL e.g. /recipes/new)
      => errors do display but not in a field_with_errors div

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
