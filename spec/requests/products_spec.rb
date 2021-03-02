require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "works! (now write some real specs)" do

      
      user = User.create!(name: "jacob", email: "jacob@email.com", password: "password")
      
      supplier = Supplier.create!(name: "Alibaba", email: "Alibaba@email.com", phone: "1-800-828-4444")


      Product.create!({ name: "Glowing Moon Lamp", price: 30, description: "3 setting glowing moon lamp, great as a gift", supplier_id: supplier.id })
      Product.create!({ name: "Star projector", price: 25.99, description: "Star projector map/nightlight, plays music", supplier_id: supplier.id  })
      Product.create!({ name: "Mens Bohemian", price: 150.00, description: "Mens bohemian robe, 100% silk, great for festivals, lounging, eye catching, soft", supplier_id: supplier.id  })
      Product.create!({ name: "Tye-dye Tapestry", price: 46.00, description: "Psychadelic tapestry, lots of variety, great for apartments, houses, festivals", supplier_id: supplier.id  })

      get "http://localhost:3000/api/products"
      products = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(products.length).to eq(4)
    end
  end


end
