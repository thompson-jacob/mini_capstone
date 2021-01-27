class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = Order.all
    render "index.json.jb"
  end

  def create
    product = Product.find_by(id: params[:product_id])

    @subtotal = product.price * params[:quantity].to_i
    @tax = @subtotal * 0.09
    @total = @subtotal + @tax

    @order = Order.new(
      user: current_user,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: @subtotal,
      tax: @tax,
      total: @total,
    )
    @order.save
    render "show.json.jb"
  end

  def show
    @order = current_user.find_by(id: params[:id])
    render "show.json.jb"
  end

  # render partial: "order.json.jb", locals: { order: order }
end
