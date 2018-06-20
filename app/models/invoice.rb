class Invoice < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :line_items
end
