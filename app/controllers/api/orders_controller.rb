class Api::OrdersController < ApplicationController
  #make show action
  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    render "show.json.jbuilder"
  end

  #make create action
  def create
    # product = Product.find_by(id: params[:product_id])
    # calculated_subtotal = params[:quantity].to_i * product.price
    # calculated_tax = calculated_subtotal * 0.09
    # calculated_total = calculated_tax + calculated_subtotal

    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

    calculated_subtotal = 0
    @carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
      )
    @order.save

    @carted_products.each do |carted_product|
      carted_product.status = 'purchased'
      carted_product.order_id = @order.id
      carted_product.save
    end
    render "show.json.jbuilder"
  end
end
