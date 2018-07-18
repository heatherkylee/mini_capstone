class Product < ApplicationRecord
  has_many :orders
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  
  def is_discounted?
    price < 10
  end

  def tax #tax rate is 9%
    price * 0.09
  end

  def total
    total = price + tax
  end

  # def supplier
  #   # return supplier for this product
  #   Supplier.find_by(id: supplier_id)
  # end

  # def image
  #   Image.where(product_id: id)
  # end
end
