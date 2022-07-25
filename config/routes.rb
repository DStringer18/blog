Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :articles do
    member do
      post :archive
      post :unarchive
    end
  end

  get "archived" => "articles#archived", :as => :archived
  get "blog_index" => "articles#blog_index", :as => :blog_index
  get "copy_index" => "articles#copy_index", :as => :copy_index
  # Defines the root path route ("/")
  root "articles#index"
end
