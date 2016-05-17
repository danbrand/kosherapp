Rails.application.routes.draw do
  
   
  get 'home/index'

  devise_for :users
  
  resources :cities do
  	resources :restraunts
  end

  root 'home#index'

end
