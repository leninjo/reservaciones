Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'
  resources :bookings, except: [:show] 
  resources 'reports'
  resources 'statistics'

  get 'verificar', to: "bookings#verificar"
  
end
