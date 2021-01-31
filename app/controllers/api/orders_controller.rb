class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = Order.all
    render "index.json.jb"
  end

  def create
    @carted_products = current_user.carted_products.where(status: "carted!")

    sub_total = 0

    @carted_products.each do |carted_product|
      sub_total += carted_product.quantity * carted_product.product.price
      @tax = carted_product.product.price * 0.09
    end
    calc_tax = sub_total * 0.09

    total = calc_tax + sub_total
    @order = Order.new(
      user_id: current_user.id,
      subtotal: sub_total,
      tax: @tax,
      total: total,
    )
    @order.save
    if @order.save
      @carted_products.each { |update| update.status = "purchased!" }
    end
    render "show.json.jb"
  end

  def show
    # @carted_products = current_user.carted_products.where(status: "carted!")
    # if @carted_products.status.where(:status = "carted!"))
    @order = current_user.find_by(id: params[:id])
    render "show.json.jb"
    # else
    #   render json: {status: "No orders in cart"}
  end

  def destroy
    carted_products = CartedProduct.find_by(id: params[:id])
    carted_products.status = "removed"
    carted_product.save
    render json: { status: "Carted product successully destroyed" }
  end

  # render partial: "order.json.jb", locals: { order: order }
end
