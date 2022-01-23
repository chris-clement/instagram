Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"
  
  # get "/posts", to: "posts#index"
  # get "/posts/:id", to: "posts#show"

  resources :posts

  # match '/posts/edit/:id', to 'posts#edit', :as => :edit_post
  # match '/posts/update/:id', to 'posts#update', :as => :update_post



end
