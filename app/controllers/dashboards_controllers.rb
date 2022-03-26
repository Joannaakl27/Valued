class DashboardsController < ApplicationController
  def profile
    @consumables = Consumable.where(user: current_user)
  end
end
