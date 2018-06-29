class Api::ProductsController < ApplicationController
  #will show a specific product
  def show
    product_id = params[:id]
    @product1 = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end

  # will show all products
  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  # will create a new product
  def create
    @product1 = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description],
      image: params[:input_image]
    )
    @product1.save
    render "show.json.jbuilder"
  end  

  #below method is for bonus (Make some routes to display JSON for a handful of individual products)
  # def get_last
  #   @product_last = Product.last
  #   render "last_product_view.json.jbuilder"
  # end
end
