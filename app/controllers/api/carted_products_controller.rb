class Api::CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    # current_user.carted_products.where(status: "carted") #same as above, preferred syntax
    render "index.json.jbuilder"
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
      )
    @carted_product.save
    render "show.json.jbuilder"
  end
end

# *********
#     if params[:category]
#       category = Category.find_by(name: params[:category])
#       @products = category.products
#     else
#       @products = Product.all.order(:id)
#     end
#     render "index.json.jbuilder"
#   end