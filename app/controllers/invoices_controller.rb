class InvoicesController < ApplicationController
  def show
    @invoices = current_user.invoices.all
  end
end
