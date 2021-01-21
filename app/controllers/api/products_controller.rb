class Api::ProductsController < ApplicationController
  def index
    @products = Product
      .title_search(params[:search])
    # .discounted(params[:discount])

    # .sorted(params[:sort], params[:sort_order])

    # if params["search"]
    #   @products = @products.where("name ILIKE ?", "%#{params["search"]}%")
    # end

    # if params[:discount] == "true"
    #   @products = @products.where("price < ?", 10)
    # end

    # if params[:sort] == "price" && params[sort_order] == "asc"
    #   @products = @products.order(price: :asc)
    # elsif params[:sort] == "price" && params[sort_order] == "desc"
    #   @products = @products.order(price: :desc)
    # else
    #   @products = @products.order(price: :asc)
    # end

    render "index.json.jb"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )

    @product.save
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.id = params["id"] || @product.id
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    @product.save

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 400
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: { message: "product deleted" }
  end
end
