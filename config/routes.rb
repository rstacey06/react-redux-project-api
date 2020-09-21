# the routes here are the routes we’ll be making fetch requests to from our front end

Rails.application.routes.draw do

  # routes are scoped with api, and objectives are nested under goals so objectives can only be reached through goals
  scope :api do
    resources :todos do
      resources :goals
    end
  end

  # custom route for the goals toggle function
  get '/api/todos/:id/toggle', to: 'todos#toggle'

  # route to delete an goal
  resources :goals, only: [:destroy]

  # custom route for the goals toggle function
  patch '/api/goals/:id', to: 'goals#toggle'

end

# SCOPE
# using scope without any options (only a scope name), it will change only the resources path
# my routes are now scoped (api - so it's clear we're fetching to an api) and nested (goals within todos):
# example: /api/todos/:todo_id/goals(.:format) -- todo_goals_path

# ALL ROUTES
# all routes: http://localhost:3000/rails/info/routes
