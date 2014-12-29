Seltaauto::Application.routes.draw do
  get 'maintenance', to: 'maintenance#index'
  get 'contacts', to: 'contacts#index'
  devise_for :users

  resources :news do
    resources :comments
  end
  resources :services
  resources :partners
  resources :certificates
  resources :autoparts
  resources :oils
  resources :imports, except: [:edit, :update] do
    member do
      get :make_snapshots
      get :necessary_columns
      put :update_columns
    end
  end
  resources :categories, except: [:index, :show]
  resources :questions do
    resources :answers
  end
  resources :photos
  resources :inspection_requests, except: [:new, :edit, :update] do
    collection do
      get :new_inspection_requests
    end

    member do
      put :mark_as_viewed
    end
  end

  root to: 'home#index'

  mount Resque::Server, at: '/resque'


end
