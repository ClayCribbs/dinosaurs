Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

     ###    ########  ##     ## #### ##    ##
    ## ##   ##     ## ###   ###  ##  ###   ##
   ##   ##  ##     ## #### ####  ##  ####  ##
  ##     ## ##     ## ## ### ##  ##  ## ## ##
  ######### ##     ## ##     ##  ##  ##  ####
  ##     ## ##     ## ##     ##  ##  ##   ###
  ##     ## ########  ##     ## #### ##    ##

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    resources :activities, only: [:index]
    resources :users, only: [:index, :show]
    resources :photos
    resources :photo_print_sizes
  end

  resources :photos, only: [:index, :show] do
    member do
      post :update_cart
      get :fetch
      get :rotate
    end
    collection do
      get :fetch_collection
    end
  end

  root 'pages#index'
end
