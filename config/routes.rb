Rails.application.routes.draw do
  # get 'posts/index'
  # get '/posts', to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :posts do
    collection do
      post :confirm
    end
  end
end
