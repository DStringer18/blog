Rails.application.routes.draw do

  devise_scope :admin do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_admin_registration" # custom path to sign_up/registration
  end

  devise_for :admins

  resources :articles do
    resources :comments
    member do
      post :archive
      post :unarchive
    end
  end

  resources :tours

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'welcome', to: 'welcome#index'
  get 'about_us' => 'welcome#about_us'
  get 'food' => 'articles#food'
  get 'architecture' => 'articles#architecture'
  get 'traditions' => 'articles#traditions'
  get 'landscapes' => 'articles#landscapes'
  get 'history' => 'articles#history'
  get "archived_articles" => "articles#archived", :as => :archived_articles
  get 'credits', to: 'credits#show', :as => :credits

  # Defines the root path route ("/")
  root "welcome#index"
end
