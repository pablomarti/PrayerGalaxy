Prayergalaxy::Application.routes.draw do

  resources :missions

  get "video/index", :as => "video_page"
  get 'video/loadVideo/:id' => 'video#loadVideo', :as => 'load_video'

  get "store/index", :as => "storepage"
  match "store/results", :as => "store_search"
  get "store/checkout", :as => "checkout"
  get 'store/product/:id' => "store#product", :as => 'store_product'
  match 'store/addToCheckout' => "store#addToCheckout"
  match 'store/updateCheckout' => "store#updateCheckout"

  get "main/index", :as => "mindex"
  get "main/about", :as => "mabout"
  get "main/partners", :as => "mpartners"
  get "main/vision", :as => "mvision"
  get "main/mission", :as => "mmission"
  get "main/contact", :as => "mcontact"
  get "main/donate", :as => "mdonate"
  get "main/newUser", :as => "mnewUser"
  get "main/prayerWatches", :as => "mprayer_watches"
  get "main/showVideo" => "main#showVideo", :as => "mshow_video"
  get "main/community", :as => "mcommunity"
  get 'main/communityPost/:id' => 'main#communityPost', :as => 'communitypost'
  match 'main/validateAccount/:sec/:hsh' => "main#validateAccount", :as => "validate_account"
  match "jm_bible_college" => "main#pdfs_page", :as => "pdfs_page"

  #Recovery password
  get "password_resets/new", :as => "new_password_reset"
  match 'password_resets/create' => "password_resets#create", :as => "password_reset_create"
  match 'password_resets/edit/:id' => "password_resets#edit", :as => "edit_password_reset"
  match 'password_resets/update/:id' => "password_resets#update", :as => "password_reset_update"

  #Clients
  resources :sessions
  get "log_out" => "sessions#destroy", :as => "log_out"

  #Backend - Admin
  get "panel/index"
  post "panel/login", :as => "admin_login"
  get "panel/logout", :as => "admin_logout"
  resources :admin_levels
  resources :admins
  resources :users
  resources :contacts
  resources :videos

  #Backend - Basic Pages
  resources :abouts
  resources :partners
  resources :visions
  resources :contact_pages
  resources :prayer_watches
  resources :donations
  resources :community_posts

  #Backend - Store
  resources :categories
  resources :products

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'main#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
