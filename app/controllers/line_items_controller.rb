class LineItemsController < ApplicationController
  def new
    @invoice = Invoice.find(params[:invoice_id])
    @line_item = LineItem.new
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @line_item = @invoice.line_items.create!(line_item_params)
    @invoice.update_invoice_total
    redirect_to new_invoice_line_item_path(@invoice)
  end

  def edit
    @invoice = Invoice.find(params[:invoice_id])
    @line_item = LineItem.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:invoice_id])
    @line_item = LineItem.find(params[:id])
    @line_item.update!(line_item_params)
    @invoice.update_invoice_total
    redirect_to invoice_path(@invoice)
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @invoice = Invoice.find(params[:invoice_id])
    @line_item.destroy!
    @invoice.update_invoice_total
    redirect_to invoice_path(@invoice)
  end

  private
  def line_item_params
    params.require(:line_item).permit(:invoice_id, :description, :quantity, :price, :notes)
  end

end
