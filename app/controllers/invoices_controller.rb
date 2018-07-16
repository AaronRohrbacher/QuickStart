class InvoicesController < ApplicationController
  def show
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
       format.html
       format.pdf do
         render pdf: "Your_filename",
         template: "invoices/show.html.erb",
         layout: 'pdf.html',
         viewport_size: '1920x1080'
       end
     end
   end

  def new
    if current_user.companies.length == 0
      redirect_to dashboard_path
      flash[:notice] = "You have no companies to invoice. Please add a company."
    end
    @invoice = Invoice.new
    @companies = current_user.companies.all
  end

  def create
    @invoice = current_user.invoices.create(invoice_params)
    @companies = current_user.companies.all
    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      flash.now[:alert] = "Form is incomplete"
      render 'new'
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
    @companies = current_user.companies.all
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update!(invoice_params)
    redirect_to invoice_path(@invoice)
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to root_path
  end

  private
  def invoice_params
    params.require(:invoice).permit(:company_id, :user_id, :invoice_number, :sent_date, :due_date, :paid)
  end

end
