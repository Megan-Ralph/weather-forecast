Rails.application.routes.draw do
  root 'home#index'
  post '/weather', to: 'weather#show', as: 'weather'
end
