class Invoice < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :line_items

  def update_invoice_total
    sum = 0
    self.line_items.each { |line_item| sum += (line_item.quantity * line_item.price) }
    self.update!(total: sum)
  end
end
