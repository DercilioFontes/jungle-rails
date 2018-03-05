require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it "saves a product successfully" do
      @category = Category.create(name: 'Home')
      @product = Product.create(name: 'Fancy Table', price: 120000, quantity: 10, category: @category)
      expect(Product.find(@product.id)).not_to be_nil
    end

    it "doesn't save a product without a name" do
      @category = Category.create(name: 'Home')
      @product = Product.create(name: nil, price: 120000, quantity: 10, category: @category)
      expect(@product.errors.full_messages_for(:name)).to eq ["Name can't be blank"]
    end

    it "doesn't save a product without a price" do
      @category = Category.create(name: 'Home')
      @product = Product.create(name: 'Fancy Table', price: nil, quantity: 10, category: @category)
      expect(@product.errors.full_messages_for(:price)).to eq ["Price is not a number", "Price can't be blank"]
    end

    it "doesn't save a product without a price" do
      @category = Category.create(name: 'Home')
      @product = Product.create(name: 'Fancy Table', price: 120000, quantity: nil, category: @category)
      expect(@product.errors.full_messages_for(:quantity)).to eq ["Quantity can't be blank"]
    end

    it "doesn't save a product without a category" do
      @category = Category.create(name: 'Home')
      @product = Product.create(name: nil, price: nil, quantity: nil, category: nil)
      expect(@product.errors.full_messages_for(:category)).to eq ["Category can't be blank"]
    end

  end

end
