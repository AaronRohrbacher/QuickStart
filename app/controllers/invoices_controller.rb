class InvoicesController < ApplicationController
  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
    @companies = current_user.companies.all
  end

  def create
    @invoice = current_user.invoices.create!(invoice_params)
  end

  private
  def invoice_params
    params.require(:invoice).permit(:company_id)
  end

end
