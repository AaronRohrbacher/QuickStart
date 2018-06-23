class LineItemsController < ApplicationController
  def new
    @invoice = Invoice.find(params[:invoice_id])
    @line_item = LineItem.new
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @line_item = @invoice.line_items.create!(line_item_params)
    redirect_to new_invoice_line_item_path(@invoice)
  end

  private
  def line_item_params
    params.require(:line_item).permit(:invoice_id, :description, :quantity, :price)
  end

end
