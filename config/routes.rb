Rails.application.routes.draw do
  root to: "home#index"
  get 'dashboard', :to => 'dashboard#index'
  devise_for :users

  resources :invoices do
    resources :line_items
  end
  resources :companies
end
