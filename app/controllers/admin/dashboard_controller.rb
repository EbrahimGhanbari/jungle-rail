class Admin::DashboardController < ApplicationController
  before_filter :authenticate
  
  def show
    products = Product.all
    @quantity = 0
    products.each do |product|
      @quantity += product.quantity
    end
    
    @categories = Category.all
  end

  protected 
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['AUTHENTICATE_USERNAME'] && password == ENV['AUTHENTICATE_PASSWORD']
    end
  end
end
