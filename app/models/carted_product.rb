class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order, optional: true

  has_many :products
  has_many :orders
  has_many :users
end
