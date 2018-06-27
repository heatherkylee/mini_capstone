Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get "/product" => "products#get_product"
    get "/allproducts" => "products#get_all"
  end
end
