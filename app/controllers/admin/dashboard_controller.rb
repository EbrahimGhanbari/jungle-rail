class Admin::DashboardController < ApplicationController
  def show
    products = Product.all
    @quantity = 0
    products.each do |product|
      @quantity += product.quantity
    end
    
    @categories = Category.all
  end
end
