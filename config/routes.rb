Rails.application.routes.draw do
  get 'image/presigned_post'

  scope :image do
    root to: 'image#index'
  end

  resources :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
