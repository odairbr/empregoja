Rails.application.routes.draw do
  root 'home#index'
  resources :jobs, only:[:show, :new, :create, :edit, :update]
  resources :companies, only:[:new, :create, :show, :edit, :update]
  resources :categories, only:[:show, :new, :create]
#  resources :categories, only:
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
