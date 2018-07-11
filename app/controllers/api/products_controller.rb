class Api::ProductsController < ApplicationController
  #will show a specific product
  def show
    product_id = params[:id]
    @product1 = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end

  # will show all products
  def index
    # Shows all products in ascending order by ID

    user_input = params[:api_search]
    if user_input
      @products = Product.where("name LIKE ?", "%#{user_input}%").order(:id)
    else
      @products = Product.all.order(:id)
    end
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

  # will update an existing product in the db
  def update
     product_id = params[:id]
    # get a particular product from the db
    @product1 = Product.find_by(id: product_id)
    # to modify the particular product 
    @product1.name = params[:input_name] || @product1.name
    @product1.price = params[:input_price] || @product1.price
    @product1.description = params[:input_description] || @product1.description
    @product1.image = params[:input_image] || @product1.image
    @product1.save
    render "show.json.jbuilder"
  end

  #delete an existing product from the db
  def destroy
    # identify and retrieve the product you want to delete
    product_id = params[:id]
    @product1 = Product.find_by(id: product_id)
    #the action of removing the product from the db
    @product1.destroy
    render json: {message: "You have deleted the product"}
  end

  #below method is for bonus (Make some routes to display JSON for a handful of individual products)
  # def get_last
  #   @product_last = Product.last
  #   render "last_product_view.json.jbuilder"
  # end
end
