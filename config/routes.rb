Rails.application.routes.draw do
  root 'top#index'
  resources :categories
  resources :ai_products
  get "/search", to: "searches#search"
  get  'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks' 
end
