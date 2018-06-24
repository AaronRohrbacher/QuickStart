class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :invoice_number
      t.date :due_date
      t.boolean :paid, default: false
    end
  end
end
