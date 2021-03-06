Demo::Application.routes.draw do
  devise_for :users, skip: :registrations
  # devise_for :models
  resources :people

  #post '/events/:when' => "events#create", :as => "events"
  get '/events/:id/:edit' => "events#edit"
  get '/events/show_date' => "events#show_date", :as => "show_date"
  #get '/events/:date_time/:id' => "events#show", :as => "show_event"
  #put '/events/:when/:id' => "events#update", :as => "event"
  #get '/events/:when/new' => "events#new", :as => "new_event"
  #get '/events/:when/:id/edit' => "events#edit", :as => "edit_event"
  resources :events do
   collection do
      get :search
    end
  end
  resources :calendars
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'
    root :to => "welcome#index"

  get "welcome/say_hello" => "welcome#say"
  get "welcome" => "welcome#index", :as => :welcome
  get "welcome/events" => "events#index"
  
  get "welcome/companies" => "welcome#company", as: :company
  post "welcome/companies" => "welcome#create_company"
  get "welcome/company/:id" => "welcome#edit_company", as: :edit_company
  patch "welcome/company/:id" => "welcome#update_company"
  delete "welcome/company/:id" => "welcome#destroy_company"

  get "welcome/categories" => "welcome#category", as: :category
  post "welcome/categories" => "welcome#create_category"
  get "welcome/category/:id" => "welcome#edit_category", as: :edit_category
  patch "welcome/category/:id" => "welcome#update_category"
  delete "welcome/category/:id" => "welcome#destroy_category"

  # for calculate statistics
  get 'statistics' => 'statistics#show'
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

   #Example resource route within a namespace:
     #namespace :admin do
        #Directs /admin/products/* to Admin::ProductsController
        #(app/controllers/admin/products_controller.rb)
       #resources :products
    #end
end
