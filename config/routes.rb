Rails.application.routes.draw do
  #devise_for :models
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :wikis do
   resources :collaborators, only: [:create, :destroy]
 end

  # You can have the root of your site routed with "root"
   root 'welcome#index'

   resources :charges, only: [:new, :create]
   # resources :downgrades, only: [:new, :create]
end
