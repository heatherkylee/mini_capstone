json.id product.id
json.name product.name
json.price number_to_currency(product.price)
json.tax number_to_currency(product.tax)
json.product_total number_to_currency(product.total)
json.description product.description
json.discounted product.is_discounted?
json.categories product.categories

#display supplier info
json.supplier product.supplier
json.images product.images
#images refers to the key, image refers to the model