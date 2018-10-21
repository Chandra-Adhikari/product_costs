class ProductsController < ApplicationController
  def index
  	@products = Kaminari.paginate_array(Product.rate_conversion).page(params[:page]).per(10)
  end
end
