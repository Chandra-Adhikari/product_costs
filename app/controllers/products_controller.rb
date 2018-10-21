class ProductsController < ApplicationController
  def index
  	ip = request.ip
  	@products = Product.rate_conversion(ip)
  	@products = Kaminari.paginate_array(@products).page(params[:page]).per(10)
  end
end
