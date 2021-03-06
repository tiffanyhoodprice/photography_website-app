Rails.application.routes.draw do

  resources :messages, only: [:new, :create]

  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  root to: 'pages#index'
  get '/users/:id', to: 'users#show'
  # patch '/admin/users/:id', to: 'users#update'
  get '/about', to: 'pages#about'
  get '/contact', to: 'messages#new'
  # post '/contact.php', 'to pages#contact'
  get '/admin', to: 'pages#admin'
  get '/portraits', to: 'categorized_photos#portraits'
  get '/weddings', to: 'categorized_photos#weddings'
  get '/family', to: 'categorized_photos#family'
  get '/events', to: 'categorized_photos#events'
  get '/scenic', to: 'categorized_photos#scenic'
  post '/assign_album', to: 'albums#assign_album'
  resources :albums
  resources :categories
  resources :categorized_photos
  resources :photos
  resources :album_photos
  resources :pages
  resources :messages
  # resources :photos do
  #   put :favorite, on: :member
# end

 # Favorite photos routes
  post '/favorite/:id', to: 'photos#favorite', as: :create_favorite

  scope "/admin" do
    resources :users, only: [:index, :show, :new, :create, :edit]
  end

  namespace :api do
    namespace :v1 do
      resources :photos
    end
  end
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
