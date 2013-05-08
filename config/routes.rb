NPOCentral::Application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :accounts
  end

  namespace :employee do
    resources :auctions
    root to: redirect('/employee/auctions')
    # Account Sign up Routes
    resources :accounts, :only => [:new, :create]
  end

  root to: 'content#show'
end
