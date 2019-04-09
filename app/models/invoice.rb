class Invoice < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :line_items
  has_many :time_records
  belongs_to :status
  validates :due_date, :invoice_number, presence: true

  def update_invoice_total
    sum = 0
    self.line_items.each { |line_item| sum += (line_item.quantity * line_item.price) }
    self.update!(total: sum)
  end

  def validate_time_records(time_records)
    i = 0
    validation = false
    if time_records.length % 2 === 0
      until i >= time_records.length
        if time_records[i].punch_type === 'start' && time_records[i+1].punch_type === 'end'
          validation = true
        else
          validation = false
        end
        i += 2
      end
    end
    validation
  end

  def calculate_hours_worked(time_records)
    hours_worked = 0
    i = 0
    until i >= time_records.length
      if time_records[i].time > time_records[i+1].time
        first_time_record = time_records[i].time
        second_time_record = time_records[i+1].time + 1.day
      else
        first_time_record = time_records[i].time
        second_time_record = time_records[i+1].time
      end
      hours_worked += second_time_record - first_time_record
      i += 2
    end
    (hours_worked / 60) / 60
  end

  def add_time_records(time_records)
    self.line_items.create!(description: "#{time_records[0].date} Hours Worked", price: time_records[0].rate, quantity: calculate_hours_worked(time_records), notes: '')
  end

  def showable?
    return true if ["Awaiting Client Contract Approval", 
                    "Awaiting Contract Payment", 
                    "Contract Approved", 
                    "Awaiting Client Project Approval", 
                    "Awaiting Payment", 
                    "Complete"]
                    .include?(self.status.name)
    false
  end

  def payable?
    return true if ["Awaiting Contract Payment",
                    "Awaiting Payment"]
                    .include?(self.status.name)
  end
end
