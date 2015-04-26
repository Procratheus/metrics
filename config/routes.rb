Rails.application.routes.draw do
  # User routes
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  # Application and events routes  
  resources "registrated_applications"
  namespace :api, defaults: { format: :json } do 
    resources :events, only: [:create]
  end
  # Root to home page for new user
  root 'welcome#index'
end
