class Product < ApplicationRecord
  #place customized methods to format like ingredients list for recipe app
  #anything relating to data goes here
  #database powers the model
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
