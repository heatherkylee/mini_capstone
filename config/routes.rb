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
    #Make some routes to display JSON for a handful of individual products
    # get "/lastproduct" => "products#get_last"
  end
end
