class Company < ApplicationRecord
  has_many :invoices
  belongs_to :user
end
