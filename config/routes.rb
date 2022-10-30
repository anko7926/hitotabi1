Rails.application.routes.draw do
   # ユーザー用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

root to: "public/homes#top"

scope module: :public do
  devise_scope :user do
    post 'users/guest_sign_in', to: 'sessions#guest_sign_in'
  end
  resources :users do
    resources :likes, only: [:index]
  end
  resources :reviews do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get :search
    end
  end
  resources :genres
  resources :tags

end


# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :users
    resources :comments
    resources :reviews
    resources :likes
    resources :genres
    resources :tags
    resources :admins
  end

end
