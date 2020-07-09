Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'
  resources :bookings, except: [:show] 

end
