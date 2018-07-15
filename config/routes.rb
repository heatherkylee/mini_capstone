Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    # will display only a specific product
    get "/products/:id" => "products#show"
    # will display all products
    get "/products" => "products#index"
    # will create a new product
    post "/products" => "products#create"
    # will update an existing product in the db
    patch "products/:id" => "products#update"
    # will delete an existing product in the db
    delete "products/:id" => "products#destroy"
    #Make some routes to display JSON for a handful of individual products
    # get "/lastproduct" => "products#get_last"
    
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end
end
