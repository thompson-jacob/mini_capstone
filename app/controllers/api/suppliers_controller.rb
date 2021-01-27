class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    if params["search"]
      @suppliers = @suppliers.where("name ILIKE ?", "%#{params["search"]}%")
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
      email: params["email"],
      phone: params["phone"],
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
    @supplier.name = params["name"] || @supplier.name
    @supplier.email = params["email"] || @supplier.email
    @supplier.phone = params["phone"] || @supplier.phone
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
