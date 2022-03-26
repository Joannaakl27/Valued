class DashboardsController < ApplicationController
  def profile
    @consumables = Consumable.where(user: current_user, purchase_date: Date.today)
  end

  def history
    @consumables = Consumable.where(user: current_user)
  end
end
