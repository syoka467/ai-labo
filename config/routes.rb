Rails.application.routes.draw do
  root 'top#index'
  resources :categories
  resources :ai_products
  get "search", to: "ai_products#search"
  get  'inquiry' => 'inquiry#index'            
  post 'inquiry/confirm' => 'inquiry#confirm'   
  post 'inquiry/thanks' => 'inquiry#thanks' 
end
