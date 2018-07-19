class Api::CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity]
      )
    @carted_product.save
  end
  render "show.json.jbuilder"
end
