require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "creates a product successfully when all name, price, quantity, and category are provided" do
      @category = Category.create(id: 1, name: "test_category")
      @product = Product.create(name: "Nikita", price: 100, quantity: 3, category_id: @category.id)
      expect(@product.valid?).to eql(true)
    end
    it "does not create product if name is missing" do
      @category = Category.create(id: 1, name: "test_category")
      @product = Product.create(price: 100, quantity: 3, category_id: @category.id)
      expect(@product.valid?).to eql(false)
    end
    it "does not create product if price is missing" do
      @category = Category.create(id: 1, name: "test_category")
      @product = Product.create(name: "Nikita", quantity: 3, category_id: @category.id)
      expect(@product.valid?).to eql(false)
    end
    it "does not create product if quantity is missing" do
      @category = Category.create(id: 1, name: "test_category")
      @product = Product.create(name: "Nikita", price: 100, category_id: @category.id)
      expect(@product.valid?).to eql(false)
    end
    it "does not create product if category is missing" do
      @category = Category.create(id: 1, name: "test_category")
      @product = Product.create(name: "Nikita", price: 100, quantity: 3)
      expect(@product.valid?).to eql(false)
    end
  end
end
