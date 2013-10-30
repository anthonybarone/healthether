Healthether::Application.routes.draw do
  resources :concepts
  
  get '/pages/concept_1_the_idea', to: 'pages#concept_1_the_idea'
  get '/pages/concept_2_product_creator', to: 'pages#concept_2_product_creator'
  get '/pages/concept_3_product_types', to: 'pages#concept_3_product_types'
  get '/pages/concept_4_product_specs', to: 'pages#concept_4_product_specs'
  get '/pages/concept_5_key_players', to: 'pages#concept_5_key_players'
  get '/pages/concept_6_contracts', to: 'pages#concept_6_contracts'
  get '/pages/concept_7_payments', to: 'pages#concept_7_payments'
  get '/pages/concept_8_perform_services', to: 'pages#concept_8_perform_services'    
  get '/pages/concept_9_maintenance', to: 'pages#concept_9_maintenance'    
    
  root :to => 'pages#concept_1_the_idea'

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
