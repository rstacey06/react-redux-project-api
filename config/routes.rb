Rails.application.routes.draw do
  scope :api do
    resources :todos do
      resources :goals
    end
  end

  get '/api/todos/:id/toggle', to: 'todos#toggle'

  resources :goals, only: [:destroy]

  patch '/api/goals/:id', to: 'goals#toggle'

end
