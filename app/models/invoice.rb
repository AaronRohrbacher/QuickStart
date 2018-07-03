class Invoice < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :line_items
  has_many :time_records

  def update_invoice_total
    sum = 0
    self.line_items.each { |line_item| sum += (line_item.quantity * line_item.price) }
    self.update!(total: sum)
  end

  def calculate_hours_worked(time_records)
    hours_worked = 0
    i = 0
    until i >= time_records.length
      hours_worked += time_records[i+1].time - time_records[i].time
      i += 2
    end
    (hours_worked / 60) / 60
  end

  def add_time_records(time_records)
    self.line_items.create!(description: "#{time_records[0].date} Hours Worked", price: time_records[0].rate, quantity: calculate_hours_worked(time_records))
  end
end
