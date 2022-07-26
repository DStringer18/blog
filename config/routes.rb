Rails.application.routes.draw do
  devise_scope :admin do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_admin_registration" # custom path to sign_up/registration
  end

  devise_for :admins, :skip => [:registrations]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'user_registration'
  end


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
