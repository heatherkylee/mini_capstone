class Api::ProductsController < ApplicationController
  def get_product
    @product1 = Product.first
    render "product_view.json.jbuilder"
  end

  def get_all
    @all_products = Product.all
    render "all_products_view.json.jbuilder"
  end
end
