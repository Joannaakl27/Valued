class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  require 'open-uri'
  require 'json'
  # POST /products/get_barcode

  def index
    if params[:query].present?
      response = URI.open("https://ch-en.openfoodfacts.org/category/#{params[:query]}.json")
      json = JSON.parse(response.read)
      @products = json['products']
    else
      @products = Product.all
    end
  end

  def show
    response = URI.open("https://ch-en.openfoodfacts.org/api/v0/product/#{params[:id]}.json")
    json = JSON.parse(response.read)
    @product = json['product']
  end
end
