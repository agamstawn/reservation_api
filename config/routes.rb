Rails.application.routes.draw do
  resources :reservations
  post '/reservations/:code', to: 'reservations#change_reservation'
end
