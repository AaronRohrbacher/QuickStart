class DashboardController < ApplicationController
  def index
    # @invoices = current_user.invoices.all
    @invoices = current_user.invoices.all.order(id: :desc).page(params[:invoice_page]).per(1)

    @companies = current_user.companies.all.order(id: :desc).page(params[:company_page]).per(1)
  end
end
