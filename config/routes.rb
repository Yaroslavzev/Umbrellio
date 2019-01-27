Rails.application.routes.draw do
  resources :rates, only: [:create] do
    collection do
      post "top_amount"
      get "get_ip"
    end
  end
  resources :posts, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
