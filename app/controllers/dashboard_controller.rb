class DashboardController < ApplicationController
  def index
    # @invoices = current_user.invoices.all
    @invoices = current_user.invoices.all.order(id: :desc).page(params[:invoice_page]).per(5)

    @companies = current_user.companies.all.order(id: :desc).page(params[:company_page]).per(5)

    @unpaid_invoices = current_user.invoices.where(paid: false).order(id: :desc).page(params[:unpaid_invoice_page]).per(5)

    @overdue_invoices = current_user.invoices.where("due_date < ? and paid = ?", Date.today, false).order(id: :desc).page(params[:overdue_invoice_page]).per(5)
  end
end
