class DashboardsController < ApplicationController
  def profile
    @consumables = Consumable.where(user: current_user, purchase_date: Date.today)
    daily_emissions = 0
    @consumables.each do |consumable|
      daily_emissions += consumable.emission
    end
    @percent_daily_emissions = [(daily_emissions / 4.5).round(2) * 100, (1 - (daily_emissions / 4.5).round(2)) * 100]
  end

  def history
    @consumables = Consumable.where(user: current_user)
    @data_keys = []
    @data_values = []
    @consumables.each do |consumable|
      if @data_keys.include? consumable.purchase_date.to_date.strftime("%d/%m/%Y")
        i = @data_keys.index(consumable.purchase_date.to_date.strftime("%d/%m/%Y"))
        @data_values[i] += consumable.emission
      else
        @data_keys << consumable.purchase_date.to_date.strftime("%d/%m/%Y")
        @data_values << consumable.emission
      end
    end
  end
end
