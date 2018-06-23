class InvoicesController < ApplicationController
  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    if current_user.companies.length == 0
      redirect_to dashboard_path
    end
    @user = current_user
    @invoice = Invoice.new
    @companies = current_user.companies.all
  end

  def create
    @invoice = current_user.invoices.create(invoice_params)
    redirect_to new_invoice_line_item_path(@invoice)
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  private
  def invoice_params
    params.require(:invoice).permit(:company_id)
  end

end
