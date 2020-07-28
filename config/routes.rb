Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    unauthenticated do
      root 'posts#index', as: :unauthenticated_root
    end

    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/about', to: 'pages#about', as: 'about'
  resources :posts
end
