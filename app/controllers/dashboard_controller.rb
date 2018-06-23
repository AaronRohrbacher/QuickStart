class DashboardController < ApplicationController
  def index
    @invoices = current_user.invoices.all
  end
end
