Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  match 'auth/:provider/callback', to: 'sessions#create', via: %i[get post]
  get '/login', to: 'sessions#new'
end
