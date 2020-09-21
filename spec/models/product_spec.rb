require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Product, type: :model do
  describe 'Validations' do
   
    # validation tests/examples here
    context 'given name, price, quantity, category' do
      it 'saves successfully' do
        @category = Category.new(name: 'Apparel')
        @product = Product.new(name: 'Jeans', price: 9, quantity: 1, category: @category)

        expect(@product).to be_valid
      end
    end

    context 'given no name' do 
      it 'does not save' do
        @category = Category.new(name: 'Apparel')
        @product = Product.new(name: '', price: 9, quantity: 1, category: @category)

        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'given no price' do 
      it 'does not save' do
        @category = Category.new(name: 'Apparel')
        @product = Product.new(name: 'Jeans', price: nil, quantity: 1, category: @category)
  
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end

    context 'given no quantity' do 
      it 'does not save' do
        @category = Category.new(name: 'Apparel')
        @product = Product.new(name: 'Jeans', price: 9, quantity: nil, category: @category)

        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context 'given no category' do 
      it 'does not save' do
        @category = Category.new(name: 'Apparel')
        @product = Product.new(name: 'Jeans', price: 9, quantity: 1, category: nil)
 
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end