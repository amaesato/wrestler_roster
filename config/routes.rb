Rails.application.routes.draw do

  root to: 'static_pages#home'

  resources :wrestlers do
    resources :tournaments
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
