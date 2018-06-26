class Invoice < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :line_items

  def calculate_invoice_total
    sum = 0
    self.line_items.each { |line_item| sum += (line_item.quantity * line_item.price) }
    sum
  end
end
