class Company < ApplicationRecord
  has_many :invoices
  has_and_belongs_to_many :users
end
