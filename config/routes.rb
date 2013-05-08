NPOCentral::Application.routes.draw do
  devise_for :users

  namespace :employee do
    resources :auctions
    root to: redirect('/employee/auctions')
  end

  root to: 'content#show'
end
