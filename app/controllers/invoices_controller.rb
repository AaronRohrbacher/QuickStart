class InvoicesController < ApplicationController
  def show
    @invoices = current_user.invoices.all
  end

  def new

  end
end
