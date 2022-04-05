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
      response = URI.open("https://ch-en.openfoodfacts.org/store/coop.json")
      json = JSON.parse(response.read)
      @products = json['products']
    end
  end

  def show
    response = URI.open("https://ch-en.openfoodfacts.org/api/v0/product/#{params[:id]}.json")
    json = JSON.parse(response.read)

    if json["status_verbose"] == "product not found" || json['product']["ecoscore_data"]["status"] == "unknown"
      redirect_to products_path, notice: "Sorry, product not found."
    else
      @product = json['product']
      @lca_emissions = [(@product["ecoscore_data"]["agribalyse"]["co2_agriculture"] / @product["ecoscore_data"]["agribalyse"]["co2_total"]).round(2) * 100,
                        (@product["ecoscore_data"]["agribalyse"]["co2_processing"] / @product["ecoscore_data"]["agribalyse"]["co2_total"]).round(2) * 100,
                        (@product["ecoscore_data"]["agribalyse"]["co2_packaging"] / @product["ecoscore_data"]["agribalyse"]["co2_total"]).round(2) * 100,
                        (@product["ecoscore_data"]["agribalyse"]["co2_transportation"] / @product["ecoscore_data"]["agribalyse"]["co2_total"]).round(2) * 100,
                        (@product["ecoscore_data"]["agribalyse"]["co2_distribution"] / @product["ecoscore_data"]["agribalyse"]["co2_total"]).round(2) * 100,
                        (@product["ecoscore_data"]["agribalyse"]["co2_consumption"] / @product["ecoscore_data"]["agribalyse"]["co2_total"]).round(2) * 100]
    end
  end

  def scan
  end
end
