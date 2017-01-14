Rails.application.routes.draw do
  root 'welcome#index'

  resources :articles do
    resources :comments#This creates comments as a nested resource within articles.
  end
end
