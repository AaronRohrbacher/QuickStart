class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @invoices = current_user.invoices.all
  end
end
