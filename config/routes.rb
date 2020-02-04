Rails.application.routes.draw do
  root 'home#top'
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  get 'mypage', to: "users#mypage"

  resources 'users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
