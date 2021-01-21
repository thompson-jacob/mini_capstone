class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    # .title_search(params[:search])
    # .discounted(params[:discount])

    .sorted(params[:sort], params[:sort_order])

    if params["search"]
      @suppliers = @suppliers.where("name ILIKE ?", "%#{params["search"]}%")
    end

    if params[:discount] == "true"
      @suppliers = @suppliers.where("price < ?", 10)
    end

    if params[:sort] == "price" && params[sort_order] == "asc"
      @suppliers = @suppliers.order(price: :asc)
    elsif params[:sort] == "price" && params[sort_order] == "desc"
      @suppliers = @suppliers.order(price: :desc)
    else
      @suppliers = @suppliers.order(price: :asc)
    end

    render "index.json.jb"
  end

  def show
    @supplier = Supplier.find_by(id: params["id"])
    render "show.json.jb"
  end

  def create
    @supplier = Supplier.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )

    @supplier.save
    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: 422
    end
  end

  def update
    @supplier = Supplier.find_by(id: params["id"])
    @supplier.id = params["id"] || @supplier.id
    @supplier.name = params["name"] || @supplier.name
    @supplier.price = params["price"] || @supplier.price
    @supplier.image_url = params["image_url"] || @supplier.image_url
    @supplier.description = params["description"] || @supplier.description
    @supplier.save

    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: 400
    end
  end

  def destroy
    supplier = Supplier.find_by(id: params["id"])
    supplier.destroy
    render json: { message: "supplier deleted" }
  end
end
