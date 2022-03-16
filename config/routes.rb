Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "validators#index"
  get '/validators/:id', to: 'validators#show', as: 'validator'
  get '/validators/discord/:id', to: 'validators#show_discord', as: 'validator_discord'
end
