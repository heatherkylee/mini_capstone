class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :carted_products #because we deleted product_id from orders

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }


  
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
