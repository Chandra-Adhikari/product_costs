class ProductsController < ApplicationController
  def index
  	@products = Product.rate_conversion
  	@products = Kaminari.paginate_array(@products).page(params[:page]).per(10)
  end
end
