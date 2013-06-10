Rails.application.routes.draw do
  resources :ember_users
  devise_for :users, :controllers => {:sessions => 'sessions', :omniauth_callbacks => "users/omniauth_callbacks"}

  devise_scope :user do
    get 'logout' => 'sessions#destroy'
  end
end
