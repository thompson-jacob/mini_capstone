class Product < ApplicationRecord
  #place customized methods to format like ingredients list for recipe app
  #anything relating to data goes here
  #database powers the model

  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 2..500 }
  validates :supplier, presence: true

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products
  # def supplier
  #   #look in the supplier's table for a supplier with an id that matches
  #   Supplier.find_by(id: supplier_id)
  # end

  scope :title_search, ->(search_terms) { where("name ILIKE ?", "%#{search_terms}%") }
  # scope :discounted, ->(check_discount) {if check_discount where("price < ?", 10)}

  def is_discounted?
    if price < 10
      true
    else
      false
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def main_image_url
    images.length > 0 ? images[0].url : "https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
  end
end
