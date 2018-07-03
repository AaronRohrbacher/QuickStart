class TimeRecordsController < ApplicationController
  def new
    @invoice = Invoice.find(params[:invoice_id])
    @time_records = @invoice.time_records.where(added_to_line_items: false)
    @time_record = TimeRecord.new

    if params[:add]
      @invoice.add_time_records(@time_records)
      @invoice.update_invoice_total
      @time_records.each do |record|
        record.added_to_line_items = true
      end
      redirect_to new_invoice_time_record_path
    end
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @time_record = @invoice.time_records.create!(time_record_params)
    redirect_to new_invoice_time_record_path
  end

  private
  def time_record_params
    params.require(:time_record).permit(:invoice_id, :date, :time, :rate, :punch_type, :add_to_notes, :added_to_line_items)
  end
end
