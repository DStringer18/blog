Rails.application.routes.draw do

  devise_for :admins


  resources :copies do
    member do
      post :archive
      post :unarchive
    end
  end

  resources :blogs do
    resources :comments
    member do
      post :archive
      post :unarchive
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'articles', to: 'articles#index'
  get "archived_blogs" => "blogs#archived", :as => :archived_blogs
  get "archived_copies" => "copies#archived", :as => :archived_copies
  get 'credits', to: 'credits#show', :as => :credits

  # Defines the root path route ("/")
  root "articles#index"
end
