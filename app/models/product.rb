class Product < ApplicationRecord
  def is_discounted?
    price < 10
  end

  def tax #tax rate is 9%
    price * 0.09
  end

  def total
    total = price + tax
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end
end
