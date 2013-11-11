Rails.application.routes.draw do
  resources :ember_users
  devise_for :users, :controllers => {
    :sessions => 'sessions', 
    :registrations => 'registrations',
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  devise_scope :user do
    get 'logout' => 'sessions#destroy'
  end

  get "users/:id", to: "ember_users#show"
  get "users/:id.json", to: "ember_users#show"
  get "users.json", to: "ember_users#index"
end
