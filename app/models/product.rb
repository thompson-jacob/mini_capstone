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
end
