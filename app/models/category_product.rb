class CategoryProduct < ApplicationRecord
  belongs_to :product_id
  belongs_to :category_id
end
