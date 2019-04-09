class TimeRecordsController < ApplicationController
  before_action :is_admin
  def new
    @invoice = Invoice.find(params[:invoice_id])
    @time_records = @invoice.time_records.where(added_to_line_items: false)
    @time_record = TimeRecord.new

    if params[:add]
      if @invoice.validate_time_records(@time_records) === true
        @invoice.add_time_records(@time_records)
        @invoice.update_invoice_total
        @time_records.each do |record|
          record.update(added_to_line_items: true)
        end
      else
        flash[:alert] = "Invalid time record. Records must be in order of 'start' and 'end.'"
      end
      redirect_to new_invoice_time_record_path
    end
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @time_record = @invoice.time_records.create!(time_record_params)
    redirect_to new_invoice_time_record_path
  end

  def destroy
    @time_record = TimeRecord.find(params[:id])
    @time_record.destroy!
    redirect_to new_invoice_time_record_path
  end

  private
  def time_record_params
    params.require(:time_record).permit(:invoice_id, :date, :time, :rate, :punch_type, :add_to_notes, :added_to_line_items)
  end
end
