json.id @carted_product.id #carted_product id 
json.product_id @carted_product.product_id 
json.quantity @carted_product.quantity
json.status @carted_product.status
json.product do
  json.partial! @carted_product.product_id, partial: 'products/product', as: :product_id
end