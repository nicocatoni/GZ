Rails.application.routes.draw do
  get 'geocoder/findaddress'
  resources :growshops  do
    resources :comments, shallow: true
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'assists/index'
  get 'pages/index'
  
 
  root to: "growshops#index" 
 
  
end
