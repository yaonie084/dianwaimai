require 'sidekiq/web'

Rails.application.routes.draw do

  namespace :dashboard do
    get 'main/index'
    root 'main#index'
    # get 'order/index'
    resources :orders

    post 'add_item_count/:id/:order_id' => 'product_items#add_item_count', as: :add_item_count
    post 'sub_item_count/:id/:order_id' => 'product_items#sub_item_count', as: :sub_item_count
    post 'order/:id/finish_check' => 'orders#finish_check', as: :finish_check
  end

  mount Sidekiq::Web => '/sidekiq'
  
  get 'main/index'
  root 'main#index'

  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register', sign_up: 'join_us'  }
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
