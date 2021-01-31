Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"
  # get "/products" => "products#index"
  # post "/products" => "products#create"
  # get "/products/:id" => "products#show"
  # patch "/products/:id" => "products#update"
  # delete "/products/:id" => "products#destroy"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/products" => "products#index"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    get "/suppliers" => "suppliers#index"
    post "/suppliers" => "suppliers#create"
    get "/suppliers/:id" => "suppliers#show"
    patch "/suppliers/:id" => "suppliers#update"
    delete "/suppliers/:id" => "suppliers#destroy"

    #USER ROUTES
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    #ORDER ROUTES
    post "/orders" => "orders#create"
    get "/orders/:id" => "orders#show"
    get "/orders" => "orders#index"

    #CARTEDPRODUCT ROUTES
    post "/carted_products" => "carted_products#create"
    get "/carted_products" => "carted_products#index"
    delete "/carted_products" => "carted_products#destroy"
  end
end
