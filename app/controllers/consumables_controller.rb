require 'open-uri'
require 'json'

class ConsumablesController < ApplicationController
  def new
    @consumable = Consumable.new
    response = URI.open("https://ch-en.openfoodfacts.org/api/v0/product/#{params[:product_id]}.json")
    json = JSON.parse(response.read)
    @product = json['product']
  end

  def create
    @consumable = Consumable.new(consumable_params)
    response = URI.open("https://ch-en.openfoodfacts.org/api/v0/product/#{@consumable.product_barcode}.json")
    json = JSON.parse(response.read)
    @product = json['product']
    @consumable.user = current_user
    @consumable.product_barcode = @product["_id"]
    @consumable.product_name = @product["product_name"]
    @consumable.product_image = @product["image_front_url"]
    @consumable.product_brand = @product["brands"]
    @consumable.emission = (@product["ecoscore_data"]["agribalyse"]["co2_total"] * @consumable.serving_size * @consumable.number_of_servings ) / @product["product_quantity"].to_f
    @consumable.save
    redirect_to dashboards_path
  end

  def destroy
    @consumable = Consumable.find(params[:id])
    @consumable.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to dashboards_path
  end

  private

  def consumable_params
    params.require(:consumable).permit(:serving_size, :number_of_servings, :purchase_date, :product_barcode)
  end

end
