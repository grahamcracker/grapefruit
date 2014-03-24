Grapefruit::Application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  devise_scope :user do
    authenticated :user do
      root 'home#dashboard', as: "authenticated_root"
    end
    unauthenticated :user do
      root 'guest#landing'
    end
  end

  get 'about' => 'guest#about'
  get 'tos' => 'guest#tos'
  get 'contact' => 'guest#contact'

  devise_for :users, :skip => [:sessions]
  as :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :courses do

    resources :documents, shallow: true

    resources :course_users, only: [:create]

    resources :capsules do

      resources :documents, shallow: true

      resources :lectures do
        resources :documents, shallow: true
        resources :videos, only: [:new, :create, :show, :edit, :update, :destroy] do
          resources :video_texts, only: [:new, :create, :index, :update, :destroy]
        end
      end

      resources :problem_sets

    end

    resources :topics, only: [:new, :create, :show, :index] do
      resources :replies, only: [:create]
    end

  end

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
